<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IrisEComProjeto._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet"/>
    <main>
        <div class="container mt-5">
            <h2 class="mb-4">Produtos</h2>
            <div id="produtos" class="produtos-grid">

            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: 'https://localhost:7178/api/Produto', 
            method: 'GET',
            success: function (data) {
                var produtos = $('#produtos');
                data.forEach(function (produto) {
                    var produtoItem = '<div class="produtoItem">' +
                        '<img src="' + produto.imagem + '" alt="' + produto.nome + '">' +
                        '<h3><a href="Produto.aspx?id=' + produto.id + '">' + produto.nome + '</a></h3>' +
                        '<p>Preço: R$ ' + produto.preco.toFixed(2) + '</p>' +
                        '<p>' + produto.descricao + '</p>' +
                        '</div>';
                    produtos.append(produtoItem);
                });
                },
                error: function (error) {
                    console.error('Erro ao buscar dados da API:', error);
                }
            });
    });
</script>
    </main>

</asp:Content>
