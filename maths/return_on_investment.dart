/// Calculates Return on Investment (ROI) as a percentage.
/// ROI measures the profitability of an investment relative to its cost.
///
/// Formula: ROI = (Gain - Cost) / Cost * 100
///
/// Reference: https://www.investopedia.com/terms/r/returnoninvestment.asp

double returnOnInvestment(
    double gainFromInvestment, double costOfInvestment) {
  if (costOfInvestment <= 0) {
    throw ArgumentError('costOfInvestment must be greater than 0');
  }
  return (gainFromInvestment - costOfInvestment) / costOfInvestment * 100;
}

void main() {
  print(returnOnInvestment(1000, 500));  // 100.0
  print(returnOnInvestment(500, 500));   // 0.0
  print(returnOnInvestment(200, 500));   // -60.0
}
