enum Currency { dollar, pound, euro }

/// returns the data passed or a placeholder if null
String showDataOrPlaceholder(data) {
  return data == null ? '--' : data.toString();
}

/// returns the amount corresponding to currency passed
int currencyConverter(int amount, Currency currency) {
  if (amount == null) {
    return null;
  }

  switch (currency) {
    case Currency.pound:
      return (0.81 * amount).round();
    case Currency.euro:
      return (0.91 * amount).round();
      break;
    default:
      return amount;
  }
}
