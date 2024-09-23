<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="IrisEComProjeto.Categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet"/>
    <main>
            <div class="container mt-5">
                <div id="produtos" class="row mt-5">
                </div>
            </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                function getParameterByName(nome) {
                    var url = new URL(window.location.href);
                    return url.searchParams.get(nome);
                }

                var idCategoria = getParameterByName('id');
                console.log("ID do Produto:", idCategoria);


                if (idCategoria) {
                    var apiUrl = 'https://localhost:7178/BuscaPorCategoria/' + idCategoria;
                    console.log("URL da API:", apiUrl);

                    $.ajax({
                    url: apiUrl,
                    method: 'GET',
                    success: function (data) {
                        var produtos = $('#produtos');
                        data.forEach(function (produto) {
                            var produtoItem = '<div class="col-md-4 produtoItem">' +
                                '<div class="card">' +
                                '<img src="' + produto.imagem + '" class="card-img-top" alt="' + produto.nome + '">' +
                                '<div class="card-body">' +
                                '<h5 class="card-title"><a href="Produto.aspx?id=' + produto.id + '" >' + produto.nome + '</a></h5>' +
                                '<p class="card-text">R$ ' + produto.preco.toFixed(2) + '</p>' +
                                '<p class="card-text">12x sem juros</p>' +
                                '<button class="btn btn-warning btn-block"><a href="EmConstrucao.aspx">Comprar</a></button>' +
                                '</div>' +
                                '</div>' +
                                '</div>';
                            produtos.append(produtoItem);
                        });
                    },
                    error: function (error) {
                        console.error('Erro ao buscar dados da API:', error);
                    }
                    });
                }
            });
        </script>
    </main>

</asp:Content>
