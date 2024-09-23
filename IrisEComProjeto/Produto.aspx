<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Produto.aspx.cs" Inherits="IrisEComProjeto.Produto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet"/>
    <main>
        <div class="container mt-4 shadow p-3 mb-5 bg-white rounded">
            <div id="detalhes" class="prodDetalhes">
        
            </div>
        </div>

     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        function getParameterByName(nome) {
            var url = new URL(window.location.href);
            return url.searchParams.get(nome);
        }

        var idProduto = getParameterByName('id');
        console.log("ID do Produto:", idProduto); 


        if (idProduto) {
            var apiUrl = 'https://localhost:7178/BuscaPorId/' + idProduto;
            console.log("URL da API:", apiUrl); 

            $.ajax({
                url: apiUrl, 
                method: 'GET',
                success: function (produto) {
                    var productDetails = $('#detalhes');
                    var productContent = '<img src="' + produto.imagem + '" alt="' + produto.nome + '">' +
                        '<h3>' + produto.nome + '</h3>' +
                        '<p class="card-text bold">R$ ' + produto.preco.toFixed(2) + '</p>' +
                        '<p class="card-text">12x sem juros</p>' +
                        '<button class="btn btn-outline-dark"><a href="EmConstrucao.aspx">Comprar</a></button>' +
                        '<h4>Detalhes do produto</h4>' +
                        '<p class="card-text">' + produto.descricao + '</p>'; +
                        '<h4>Informações técnicas</h4>'
                        '<p class="card-text">' + produto.infoTecnica + '</p>';
                    productDetails.html(productContent);
                },
                error: function (error) {
                    console.error('Erro ao buscar dados da API:', error);
                }
            });
        } else {
            $('#detalhes').html('<p>Produto não encontrado.</p>');
        }

        //Editar produto
        $('#btn-editar').on('click', function () {
            window.location.href = 'EditarProduto.aspx';
        });
    });
</script>
    </main>
</asp:Content>
