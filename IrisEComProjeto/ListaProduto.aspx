  <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaProduto.aspx.cs" Inherits="IrisEComProjeto.ListaProduto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link href="~/Content/bootstrap.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Lista de Produtos</h2>
        <table class="table table-striped table-bordered" id="produtosTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Preço</th>
                    <th>Quantidade</th>
                    <th>Imagem</th>
                    <th>Categoria</th>
                    <th>Usuário</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <button id="editButton" type="button" class="btn btn-dark btn-block">Editar Produto</button>
    </div>

     <script src="~/Scripts/jquery-3.7.0.min.js"></script>
 <script src="~/Scripts/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $.ajax({
                url: 'https://localhost:7178/api/Produto',
                method: 'GET',
                success: function (data) {
                    var tableBody = $('#produtosTable tbody');
                    data.forEach(function (produto) {
                        var row = '<tr>' +
                            '<td>' + produto.id + '</td>' +
                            '<td>' + produto.nome + '</td>' +
                            '<td>' + produto.preco + '</td>' +
                            '<td>' + produto.quantidade + '</td>' +
                            '<td>' + produto.imagem + '</td>' +
                            '<td>' + produto.categoriaId + '</td>' +
                            '<td>' + produto.usuarioId + '</td>' +
                            '<td>' +
                            '<button class="btn btn-danger btn-sm excluir" data-id="' + produto.id + '">Excluir</button>' +
                            '</td>' +
                            '</tr>';
                        tableBody.append(row);
                    });
                }
            });

            $('#produtosTable').on('click', '.excluir', function () {
                var id = $(this).data('id');
                $.ajax({
                    url: 'https://localhost:7178/api/Produto/' + id,
                    method: 'DELETE',
                    success: function () {
                        alert('Produto excluído com sucesso!');
                        window.location.href = 'ListaProduto.aspx';
                    },
                    error: function (error) {
                        console.error('Erro ao excluir produto:', error);
                    }
                });
            });

            $('#editButton').on('click', function () {
                window.location.href = 'EditarProduto.aspx';
            });
        });
    </script>
</asp:Content>
