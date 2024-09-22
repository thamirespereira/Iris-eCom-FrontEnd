<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="IrisEComProjeto.Usuarios" Async="true"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
           <h2>Lista de Usuários</h2>
    <table class="table table-striped table-bordered" id="usuariosTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Email</th>
                <th>CEP</th>
                <th>Endereço</th>
                <th>Bairro</th>
                <th>Cidade</th>
                <th>UF</th>
                <th>Data de nascimento</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
           
        </tbody>
    </table>
        <button id="editButton" type="button" class="btn btn-primary btn-block">Editar Cliente</button>
</div>

    <!-- Conexão com a api -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>

     $(document).ready(function () {
         $.ajax({
             url: 'https://localhost:7178/api/Usuario',
             method: 'GET',
             success: function (data) {
                 var tableBody = $('#usuariosTable tbody');
                 data.forEach(function (usuario) {
                     var row = '<tr>' +
                         '<td>' + usuario.id + '</td>' +
                         '<td>' + usuario.nome + '</td>' +
                         '<td>' + usuario.email + '</td>' +
                         '<td>' + usuario.cep + '</td>' +
                         '<td>' + usuario.endereco + '</td>' +
                         '<td>' + usuario.bairro + '</td>' +
                         '<td>' + usuario.cidade + '</td>' +
                         '<td>' + usuario.uf + '</td>' +
                         '<td>' + usuario.dataNascimento + '</td>' +
                         '<td>' +
                         '<button class="btn btn-danger btn-sm excluir" data-id="' + usuario.id + '">Excluir</button>' +
                         '</td>' +
                         '</tr>';
                     tableBody.append(row);
                 });


             },
                 error: function(error) {
                     console.error('Erro ao buscar dados da API:', error);
                 }
         });

         //Excluir usuário
         $(document).on('click', '.excluir', function () {
             var id = $(this).data('id');
             if (confirm('Tem certeza que deseja excluir este usuário?')) {
                 fetch(`https://localhost:7178/api/Usuario/${id}`, {
                     method: 'DELETE'
                 })
                     .then(response => {
                         if (!response.ok) {
                             throw new Error('Erro na requisição: ' + response.statusText);
                         }
                         $(this).closest('tr').remove();
                         alert('Usuário excluído com sucesso!');
                         window.location.href = 'Default.aspx';
                     })
                     .catch(error => {
                         console.error('Erro ao excluir usuário:', error);
                     });
             }
         });

         //Editar usuário
         $('#editButton').on('click', function () {
             window.location.href = 'EditarUsuario.aspx';
         });
     })
             
        
    </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</asp:Content>