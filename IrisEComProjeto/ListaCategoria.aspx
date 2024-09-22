<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaCategoria.aspx.cs" Inherits="IrisEComProjeto.ListaCategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link href="~/Content/bootstrap.min.css" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Lista Categorias</h2>
        <table class="table table-striped table-bordered" id="listaCategorias">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Imagem</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>

        <button id="editButton" type="button" class="btn btn-dark btn-block">Editar Categoria</button>

    </div>

        <script src="~/Scripts/jquery-3.7.0.min.js"></script>
        <script src="~/Scripts/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $.ajax({
                url: 'https://localhost:7178/api/Categoria',
                method: 'GET',
                success: function (data) {
                    var tableBody = $('#listaCategorias tbody');
                    data.forEach(function (categoria) {
                        var row = '<tr>' +
                            '<td>' + categoria.id + '</td>' +
                            '<td>' + categoria.nome + '</td>' +
                            '<td>' + categoria.imagem + '</td>' +
                            '<td>' +
                            '<button class="btn btn-danger btn-sm excluir" data-id="' + categoria.id + '">Excluir</button>' +
                            '</td>' +
                            '</tr>';
                        tableBody.append(row);
                    });
                }
            });

            $('#listaCategorias').on('click', '.excluir', function () {
                var id = $(this).data('id');
                $.ajax({
                    url: 'https://localhost:7178/api/Categoria/' + id,
                    method: 'DELETE',
                    success: function () {
                        alert('Categoria excluída com sucesso!');
                        window.location.href = 'ListaCategoria.aspx';
                    },
                    error: function (error) {
                        console.error('Erro ao excluir categoria:', error);
                    }
                });
            });

            $('#editButton').on('click', function () {
                window.location.href = 'EditarCategoria.aspx';
            });
        });
    </script>
</asp:Content>
