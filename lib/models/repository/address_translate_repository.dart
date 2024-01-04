abstract interface class AddressTranslateItemsRepository{
  Future<List> getAddressTranslates(int currentPage, String keyword);
}
