class CartaoEntity {
  late int? cartaoID;
  String? descricao;
  String? numero;
  String? validade;
  String? cvv;
  String? senha;

  CartaoEntity({
      this.cartaoID,
      this.descricao,
      this.numero,
      this.cvv,
      this.senha,
      this.validade
});

  @override
  String toString() {
    return '$cartaoID - $descricao - $numero';
  }
}
