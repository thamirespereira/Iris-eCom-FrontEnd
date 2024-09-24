<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IrisEComProjeto._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <main>
        
    <div class="container mt-5">
    <div id="carrossel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        
    </div>
    <a class="carousel-control-prev" href="#carrossel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carrossel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
</div>
        <br>
        <br>
        <br>
        <br>
        <br> 
        <br>
        <br>
        <br>
        <br>
        <br />   
        <div class="mt-5">
        <div class="container mt-5">
            <h3 class="display-5">Produtos recentes</h3>
            <hr />
            <div id="produtos" class="row mt-5">

            </div>
        </div>
        </div> 

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: 'https://localhost:7178/api/Produto', 
            method: 'GET',
            success: function (data) {
                var produtos = $('#produtos');
                data.forEach(function (produto) {
                    var produtoItem = '<div class="col-md-4 produtoItem">' +
                        '<div class="card shadow-sm p-3 mb-5 bg-white rounded">' +
                        '<img src="' + produto.imagem + '" class="card-img-top" alt="' + produto.nome + '">' +
                        '<div class="card-body">' +
                        '<h5 class="card-title"><a href="Produto.aspx?id=' + produto.id + '">' + produto.nome + '</a></h5>' +
                        '<p class="card-text">R$ ' + produto.preco.toFixed(2) + '</p>' +
                        '<p class="card-text">12x sem juros</p>' +
                        '<button type="button" class="btn btn-outline-dark btn-block"><a href="EmConstrucao.aspx">Comprar</a></button>' +
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

        $.ajax({
            url: 'https://localhost:7178/api/Categoria',
            method: 'GET',
            success: function (data) {
                var categorias = $('#carrossel');
                data.forEach(function (categoria, index) {
                    var activeClass = index === 0 ? 'active' : '';
                    var categoriaItem = '<div class="carousel-item ' + activeClass + '">' +
                        '<img src="' + categoria.imagem + '" class="d-block " alt="' + categoria.nome + '">' +
                        '<div class="carousel-caption d-none d-md-block">' +
                        '<h5><a href="Categoria.aspx?id=' + categoria.id + '">' + categoria.nome + '</a></h5>' +
                        '</div>' +
                        '</div>';
                    categorias.append(categoriaItem);
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
