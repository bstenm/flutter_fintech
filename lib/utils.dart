/// returns the data passed or a placeholder if null
String showDataOrPlaceholder(data) {
  return data == null ? '--' : data.toString();
}

/// returns the amount corresponding to currency passed
int currencyConverter(int amount, String currency) {
  if (amount == null) {
    return null;
  }

  switch (currency) {
    case 'pound':
      return (0.81 * amount).round();
    case 'euro':
      return (0.91 * amount).round();
      break;
    default:
      return amount;
  }
}
