import 'package:rational/rational.dart';
import 'package:test/test.dart';

/// Day-count conventions that determine the annual denominator used
/// when calculating interest for day-based frequency codes.
///
/// Only applies to day-based [FrequencyCode] values; calendar-based
/// codes (e.g. [FrequencyCode.monthly]) ignore this convention.
///
/// [actAct] uses 366 in leap years and 365 otherwise (ISDA simplified).
/// Full ISDA Act/Act splits periods that span a year boundary across
/// two denominators — that complexity is not implemented here.
///
/// See https://en.wikipedia.org/wiki/Day_count_convention
enum DayCountConvention {
  act365(0),
  act360(1),
  thirty360US(2),
  thirty360Euro(3),
  actAct(4),
  actB(5);

  const DayCountConvention(this.code);

  /// Numeric code for serialisation or legacy interop.
  final int code;

  /// Returns the annual day count used as the divisor for day-based
  /// period fractions (e.g. 365 for Act/365, 360 for Act/360).
  ///
  /// [leapYear] — pass `true` when the calculation period falls within
  ///   a leap year; only affects [actAct], which uses 366 instead of 365.
  ///   All other conventions use a fixed denominator regardless of year.
  Rational denominator({bool leapYear = false}) {
    return switch (this) {
      act365 => Rational.fromInt(365),
      act360 => Rational.fromInt(360),
      thirty360Euro => Rational.fromInt(360),
      thirty360US => Rational.fromInt(360),
      // ISDA simplified: 366 in leap years, 365 otherwise
      actAct => leapYear ? Rational.fromInt(366) : Rational.fromInt(365),
      actB => Rational.fromInt(365),
    };
  }
}

/// Payment and compounding frequency codes used in interest calculations.
///
/// Codes fall into two groups:
/// - **Day-based** ([daily], [weekly], [biweekly], [luniSolaris],
///   [d_91], [d_182], [d_364]): period length expressed in fixed days.
/// - **Calendar-based** ([monthly], [bimonthly], [quarterly],
///   [semiAnnual], [annually]): period expressed as an exact month fraction,
///   independent of the day-count convention.
///
/// See https://en.wikipedia.org/wiki/Payment_schedule
enum FrequencyCode {
  daily(0),
  weekly(1),
  biweekly(2),
  luniSolaris(3),
  monthly(4),
  bimonthly(5),
  quarterly(6),
  semiAnnual(7),
  d_91(8),
  d_182(9),
  annually(10),
  d_364(11),
  zeroCoupon(12);

  const FrequencyCode(this.code);

  /// Numeric code for serialisation or legacy interop.
  final int code;

  /// Returns the numerator used in [periodFraction] for this code.
  ///
  /// For day-based codes this is the number of days in the period.
  /// For calendar-based codes this is the month-count numerator
  /// (e.g. 3 for [quarterly] → 3/12). The two groups use different
  /// divisors in [periodFraction], so the values are not comparable
  /// across groups.
  Rational _numerator() {
    return switch (this) {
      daily => Rational.one,
      weekly => Rational.fromInt(7),
      biweekly => Rational.fromInt(14),
      luniSolaris => Rational.fromInt(28),
      monthly => Rational.one,
      bimonthly => Rational.fromInt(2),
      quarterly => Rational.fromInt(3),
      semiAnnual => Rational.one,
      d_91 => Rational.fromInt(91),
      d_182 => Rational.fromInt(182),
      annually => Rational.one,
      d_364 => Rational.fromInt(364),
      zeroCoupon => Rational.zero,
    };
  }

  /// Returns the fraction of a year this frequency represents.
  ///
  /// Day-based codes divide [_numerator] by [denominator] (the annual
  /// day count from the chosen [DayCountConvention]). Calendar-based
  /// codes divide [_numerator] by a fixed month divisor, making them
  /// independent of the convention.
  ///
  /// [denominator] — annual day count (e.g. 360 or 365) supplied by
  ///   [DayCountConvention.denominator]; ignored for calendar-based codes.
  ///
  /// Returns an exact [Rational] safe for financial arithmetic.
  Rational periodFraction(Rational denominator) {
    return switch (this) {
      // Day-based: days in period / annual day count
      daily => _numerator() / denominator,
      weekly => _numerator() / denominator,
      biweekly => _numerator() / denominator,
      luniSolaris => _numerator() / denominator,
      d_91 => _numerator() / denominator,
      d_182 => _numerator() / denominator,
      d_364 => _numerator() / denominator,

      // Calendar-based: month numerator / months in year (or half-year)
      monthly => _numerator() / Rational.fromInt(12),
      bimonthly => _numerator() / Rational.fromInt(12),
      quarterly => _numerator() / Rational.fromInt(12),
      semiAnnual => _numerator() / Rational.fromInt(2),
      annually => Rational.one,

      // Zero coupon bonds accrue no periodic interest
      zeroCoupon => Rational.zero,
    };
  }
}

/// Returns the annual period fraction for [frequencyCode].
///
/// Resolves the day-count denominator from [dayCountConvention] and
/// delegates the per-code fraction logic to [FrequencyCode.periodFraction].
///
/// [frequencyCode] — the payment or compounding frequency.
/// [dayCountConvention] — supplies the annual day-count denominator
///   (e.g. 360 for Act/360, 365 for Act/365).
/// [leapYear] — pass `true` when the period falls in a leap year;
///   only affects [DayCountConvention.actAct] (366 vs 365).
///
/// Returns an exact [Rational].
Rational periodFraction(
  FrequencyCode frequencyCode,
  DayCountConvention dayCountConvention, {
  bool leapYear = false,
}) {
  return frequencyCode.periodFraction(
    dayCountConvention.denominator(leapYear: leapYear),
  );
}

/// Returns the interest amount accrued over a single bullet period.
///
/// A bullet period has no amortisation — the full [balance] is outstanding
/// for the entire period. Interest = balance × annual rate × period fraction.
///
/// [balance] — outstanding principal on which interest accrues.
/// [interestRate] — annual rate as a decimal (e.g. `0.085` for 8.5 %).
/// [periodFractionOfYear] — fraction of a year per period; derive via
///   [periodFraction].
///
/// Returns the interest amount for one period as an exact [Rational].
///
/// See https://en.wikipedia.org/wiki/Interest#Simple_interest
Rational calculateBulletInterest(
  Rational balance,
  Rational interestRate,
  Rational periodFractionOfYear,
) {
  return balance * interestRate * periodFractionOfYear;
}

/// Returns the total interest paid over the full life of a loan.
///
/// Derives interest as the difference between all repayments made and the
/// original principal borrowed. Works for any repayment structure (bullet,
/// equal-principal, annuity) provided [totalRepaymentAmount] is the sum of
/// all period totals from the corresponding schedule.
///
/// [totalRepaymentAmount] — sum of every period's total payment.
/// [principal] — original loan amount (must match the schedule's principal).
///
/// Returns an exact [Rational]; negative if [totalRepaymentAmount] <
/// [principal].
///
/// See https://en.wikipedia.org/wiki/Interest
Rational calculateTotalInterestPaid(
  Rational totalRepaymentAmount,
  Rational principal,
) {
  return totalRepaymentAmount - principal;
}

/// Returns the per-period interest rate for a given frequency and day-count.
///
/// Converts [annualInterestRatePercentage] to a per-period decimal rate by
/// dividing by 100 then multiplying by the period fraction derived from
/// [frequencyCode] and [dayCount].
///
/// [annualInterestRatePercentage] — annual rate as a percentage (e.g. `8.5`).
/// [frequencyCode] — payment/compounding frequency (monthly, quarterly, etc.).
/// [dayCount] — day-count convention used to derive the annual denominator.
/// [leapYear] — whether the period falls in a leap year; affects Act/Act only.
///
/// Returns zero for non-positive rates; otherwise returns an exact [Rational].
Rational _interestRatePerPeriod(
  Rational annualInterestRatePercentage,
  FrequencyCode frequencyCode,
  DayCountConvention dayCount,
  bool leapYear,
) {
  if (annualInterestRatePercentage <= Rational.zero) {
    return Rational.zero;
  }

  // Divides by 100 to convert percentage to decimal, then by the period
  // fraction so the result applies to one compounding period, not a full year.
  return annualInterestRatePercentage /
      Rational.fromInt(100) *
      frequencyCode.periodFraction(dayCount.denominator(leapYear: leapYear));
}

/// Returns (1 + r)^n — the compound growth factor for [numberOfPeriods].
///
/// Uses repeated multiplication instead of [dart:math]'s `pow` to keep all
/// arithmetic in exact [Rational] fractions. Shared by [futureValue] and
/// [presentValue] to avoid duplicating the loop.
///
/// [annualInterestRatePercentage] — annual rate as a percentage (e.g. `8.5`).
/// [frequencyCode] — compounding frequency (monthly, quarterly, etc.).
/// [dayCount] — day-count convention for the annual denominator.
/// [leapYear] — whether the period falls in a leap year; affects Act/Act only.
/// [numberOfPeriods] — number of compounding periods; returns 1 when zero.
///
/// Returns an exact [Rational] ≥ 1 for non-negative rates and periods.
Rational _calculateCompoundFactor(
  Rational annualInterestRatePercentage,
  FrequencyCode frequencyCode,
  DayCountConvention dayCount,
  bool leapYear,
  int numberOfPeriods,
) {
  final periodRate = _interestRatePerPeriod(
    annualInterestRatePercentage,
    frequencyCode,
    dayCount,
    leapYear,
  );

  var compoundFactor = Rational.one;
  final periodFactor = Rational.one + periodRate;
  for (int i = 0; i < numberOfPeriods; i++) {
    compoundFactor *= periodFactor;
  }
  return compoundFactor;
}

/// Returns the future value of [principal] after [numberOfPeriods] periods
/// of compounding.
///
/// FV = principal × (1 + r)^n, where r is the per-period rate derived from
/// [annualInterestRatePercentage], [frequencyCode] and [dayCount]. All
/// arithmetic stays in exact [Rational] fractions.
///
/// [principal] — present amount to grow forward.
/// [annualInterestRatePercentage] — annual rate as a percentage (e.g. `8.5`).
/// [frequencyCode] — compounding frequency (monthly, quarterly, etc.).
/// [dayCount] — day-count convention for the annual denominator.
/// [numberOfPeriods] — number of compounding periods; returns [principal]
///   unchanged when zero.
/// [leapYear] — whether the period falls in a leap year; affects Act/Act only.
///
/// Returns an exact [Rational].
///
/// See https://en.wikipedia.org/wiki/Future_value
Rational futureValue(
  Rational principal,
  Rational annualInterestRatePercentage,
  FrequencyCode frequencyCode,
  DayCountConvention dayCount,
  int numberOfPeriods, {
  bool leapYear = false,
}) {
  return principal *
      _calculateCompoundFactor(
        annualInterestRatePercentage,
        frequencyCode,
        dayCount,
        leapYear,
        numberOfPeriods,
      );
}

/// Returns the present value of a future [amount] discounted back over
/// [numberOfPeriods] periods.
///
/// PV = amount / (1 + r)^n — the inverse of [futureValue]. All arithmetic
/// stays in exact [Rational] fractions.
///
/// [amount] — future amount to discount back to today.
/// [annualInterestRatePercentage] — annual rate as a percentage (e.g. `8.5`).
/// [frequencyCode] — compounding frequency (monthly, quarterly, etc.).
/// [dayCount] — day-count convention for the annual denominator.
/// [numberOfPeriods] — number of compounding periods; returns [amount]
///   unchanged when zero.
/// [leapYear] — whether the period falls in a leap year; affects Act/Act only.
///
/// Returns an exact [Rational].
///
/// See https://en.wikipedia.org/wiki/Present_value
Rational presentValue(
  Rational amount,
  Rational annualInterestRatePercentage,
  FrequencyCode frequencyCode,
  DayCountConvention dayCount,
  int numberOfPeriods, {
  bool leapYear = false,
}) {
  return amount /
      _calculateCompoundFactor(
        annualInterestRatePercentage,
        frequencyCode,
        dayCount,
        leapYear,
        numberOfPeriods,
      );
}

/// One row in an amortisation schedule.
///
/// [interest] — interest charged on the opening balance for that period.
/// [principal] — principal repayment applied in that period.
/// [total] — total payment (interest + principal).
/// [balance] — closing outstanding balance after principal repayment.
typedef PeriodEntry = ({
  Rational interest,
  Rational principal,
  Rational total,
  Rational balance,
});

/// Builds an equal-principal (straight-line) amortisation schedule.
///
/// Each period repays the same fixed slice of [principal]; interest accrues
/// on the declining outstanding balance, so total payments decrease each
/// period.
///
/// Returns a map keyed by 0-based period index. Each value is a [PeriodEntry]
/// record; see [PeriodEntry] for field definitions.
///
/// [principal] — original loan amount.
/// [annualRate] — annual interest rate as a decimal (e.g. `0.085` for 8.5 %).
/// [numberOfPeriods] — total number of repayment periods; must be > 0.
/// [periodFractionOfYear] — fraction of a year per period; derive via
///   [periodFraction].
///
/// Throws [ArgumentError] if [numberOfPeriods] is not positive (the schedule
/// would divide the principal by zero).
///
/// See https://en.wikipedia.org/wiki/Amortization_schedule
Map<int, PeriodEntry> generateEqualPrincipalSchedule(
  Rational principal,
  Rational annualRate,
  int numberOfPeriods,
  Rational periodFractionOfYear,
) {
  if (numberOfPeriods <= 0) {
    throw ArgumentError.value(
      numberOfPeriods,
      'numberOfPeriods',
      'must be greater than zero',
    );
  }

  final principalPerPeriod = principal / Rational.fromInt(numberOfPeriods);
  var remainingPrincipal = principal;

  final schedule = <int, PeriodEntry>{};

  for (int i = 0; i < numberOfPeriods; i++) {
    // Interest on the opening balance before the principal is deducted.
    final interest = remainingPrincipal * annualRate * periodFractionOfYear;
    remainingPrincipal -= principalPerPeriod;

    schedule[i] = (
      interest: interest,
      principal: principalPerPeriod,
      total: principalPerPeriod + interest,
      balance: remainingPrincipal,
    );
  }

  return schedule;
}

void main() {
  group('periodFraction', () {
    test('calendar-based monthly is 1/12 regardless of day-count', () {
      expect(
        periodFraction(FrequencyCode.monthly, DayCountConvention.act365),
        equals(Rational.fromInt(1, 12)),
      );
      expect(
        periodFraction(FrequencyCode.monthly, DayCountConvention.act360),
        equals(Rational.fromInt(1, 12)),
      );
    });

    test('calendar-based quarterly reduces to 1/4', () {
      expect(
        periodFraction(FrequencyCode.quarterly, DayCountConvention.act365),
        equals(Rational.fromInt(1, 4)),
      );
    });

    test('day-based daily uses the day-count denominator', () {
      expect(
        periodFraction(FrequencyCode.daily, DayCountConvention.act365),
        equals(Rational.fromInt(1, 365)),
      );
      expect(
        periodFraction(FrequencyCode.daily, DayCountConvention.act360),
        equals(Rational.fromInt(1, 360)),
      );
    });

    test('Act/Act honours the leap-year flag', () {
      expect(
        periodFraction(
          FrequencyCode.daily,
          DayCountConvention.actAct,
          leapYear: true,
        ),
        equals(Rational.fromInt(1, 366)),
      );
      expect(
        periodFraction(FrequencyCode.daily, DayCountConvention.actAct),
        equals(Rational.fromInt(1, 365)),
      );
    });

    test('zero-coupon accrues no periodic interest', () {
      expect(
        periodFraction(FrequencyCode.zeroCoupon, DayCountConvention.act365),
        equals(Rational.zero),
      );
    });
  });

  group('calculateBulletInterest', () {
    test('interest = balance × rate × period fraction', () {
      final interest = calculateBulletInterest(
        Rational.fromInt(1000),
        Rational.parse('0.1'),
        Rational.one,
      );
      expect(interest, equals(Rational.fromInt(100)));
    });

    test('one month at 12% on 1200 is exactly 12', () {
      final interest = calculateBulletInterest(
        Rational.fromInt(1200),
        Rational.parse('0.12'),
        periodFraction(FrequencyCode.monthly, DayCountConvention.act365),
      );
      expect(interest, equals(Rational.fromInt(12)));
    });
  });

  group('calculateTotalInterestPaid', () {
    test('repayments minus principal', () {
      expect(
        calculateTotalInterestPaid(
          Rational.fromInt(1100),
          Rational.fromInt(1000),
        ),
        equals(Rational.fromInt(100)),
      );
    });

    test('negative when repayments fall short of principal', () {
      expect(
        calculateTotalInterestPaid(
          Rational.fromInt(900),
          Rational.fromInt(1000),
        ),
        equals(Rational.fromInt(-100)),
      );
    });
  });

  group('futureValue / presentValue', () {
    test('FV compounds exactly: 10000 at 12%/yr monthly for 2 periods', () {
      // period rate = 12% / 12 = 1% → factor = (101/100)^2 = 10201/10000
      final fv = futureValue(
        Rational.fromInt(10000),
        Rational.fromInt(12),
        FrequencyCode.monthly,
        DayCountConvention.act365,
        2,
      );
      expect(fv, equals(Rational.fromInt(10201)));
    });

    test('PV is the exact inverse of FV', () {
      final pv = presentValue(
        Rational.fromInt(10201),
        Rational.fromInt(12),
        FrequencyCode.monthly,
        DayCountConvention.act365,
        2,
      );
      expect(pv, equals(Rational.fromInt(10000)));
    });

    test('zero periods leaves the amount unchanged', () {
      final fv = futureValue(
        Rational.fromInt(500),
        Rational.fromInt(8),
        FrequencyCode.quarterly,
        DayCountConvention.act365,
        0,
      );
      expect(fv, equals(Rational.fromInt(500)));
    });
  });

  group('generateEqualPrincipalSchedule', () {
    // 1000 over 4 annual periods at 12%/yr (periodFraction = 1):
    // fixed principal 250/period; interest on the declining balance.
    final schedule = generateEqualPrincipalSchedule(
      Rational.fromInt(1000),
      Rational.parse('0.12'),
      4,
      Rational.one,
    );

    test('has one entry per period', () {
      expect(schedule.length, equals(4));
    });

    test('first period: interest on full balance, fixed principal', () {
      expect(schedule[0]!.interest, equals(Rational.fromInt(120)));
      expect(schedule[0]!.principal, equals(Rational.fromInt(250)));
      expect(schedule[0]!.total, equals(Rational.fromInt(370)));
      expect(schedule[0]!.balance, equals(Rational.fromInt(750)));
    });

    test('interest declines as the balance amortises', () {
      expect(schedule[1]!.interest, equals(Rational.fromInt(90)));
      expect(schedule[2]!.interest, equals(Rational.fromInt(60)));
      expect(schedule[3]!.interest, equals(Rational.fromInt(30)));
    });

    test('final balance is exactly zero', () {
      expect(schedule[3]!.balance, equals(Rational.zero));
    });

    test('summed totals reconcile with calculateTotalInterestPaid', () {
      final totalRepaid = schedule.values
          .map((e) => e.total)
          .fold(Rational.zero, (a, b) => a + b);
      expect(
        calculateTotalInterestPaid(totalRepaid, Rational.fromInt(1000)),
        equals(Rational.fromInt(300)),
      );
    });

    test('throws when numberOfPeriods is not positive', () {
      expect(
        () => generateEqualPrincipalSchedule(
          Rational.fromInt(1000),
          Rational.parse('0.12'),
          0,
          Rational.one,
        ),
        throwsArgumentError,
      );
    });
  });
}
