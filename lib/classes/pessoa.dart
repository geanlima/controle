class Pessoa {
  int id;
  String Nome;
  String Foto;
  String Telefone;
  String Email;
  String Tipo;

  Pessoa(this.id, this.Nome, this.Foto, this.Telefone, this.Email, this.Tipo);

  @override
  String toString() {
    return 'Pessoa{id: $id, Nome: $Nome, Foto: $Foto, Telefone: $Telefone, Email: $Email, Tipo: $Tipo}';
  }

}