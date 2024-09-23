<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="IrisEComProjeto.EditarUsuario" %>

<!DOCTYPE html>

<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Editar Cliente</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="editUser">
    <div class="container mt-4 shadow p-3 mb-5 bg-white rounded">
    <h2 class="mb-4">Editar Usuário</h2>

    <div class="form-group">
        <label for="id">ID:</label>
        <input type="number" id="id" name="id" class="form-control" placeholder="Digite o Id do usuário"/>
    </div>
    <div class="form-group">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" class="form-control" placeholder="Digite o seu nome"/>
    </div>

    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" class="form-control" placeholder="Digite o seu email"/>
    </div>

    <div class="form-group">
        <label for="senha">Senha:</label>
        <input type="password" id="senha" name="senha" class="form-control" placeholder="Digite a sua senha"/>
    </div>

    <div class="form-group">
        <label for="cep">CEP:</label>
        <input type="text" id="cep" name="cep" class="form-control" placeholder="Digite apenas números"/>
    </div>

    <div class="form-group">
        <label for="endereco">Endereco:</label>
        <input type="text" id="endereco" name="endereco" class="form-control" placeholder="Digite o seu endereço"/>
    </div>

    <div class="form-group">
        <label for="bairro">Bairro:</label>
        <input type="text" id="bairro" name="bairro" class="form-control" placeholder="Digite o seu bairro"/>
    </div>

    <div class="form-group">
        <label for="cidade">Cidade:</label>
        <input type="text" id="cidade" name="cidade" class="form-control" placeholder="Digite a sua cidade"/>
    </div>

    <div class="form-group">
    <label for="uf">UF:</label>
    <select id="uf" name="uf" class="form-select form-control">
        <option selected>Selecione o seu estado</option>
        <option value="AC">Acre</option>
        <option value="AL">Alagoas</option>
        <option value="AP">Amapá</option>
        <option value="AM">Amazonas</option>
        <option value="BA">Bahia</option>
        <option value="CE">Ceará</option>
        <option value="DF">Distrito Federal</option>
        <option value="ES">Espírito Santo</option>
        <option value="GO">Goiás</option>
        <option value="MA">Maranhão</option>
        <option value="MT">Mato Grosso</option>
        <option value="MS">Mato Grosso do Sul</option>
        <option value="MG">Minas Gerais</option>
        <option value="PA">Pará</option>
        <option value="PB">Paraíba</option>
        <option value="PE">Pernambuco</option>
        <option value="PI">Piauí</option>
        <option value="RJ">Rio de Janeiro</option>
        <option value="RN">Rio Grande do Norte</option>
        <option value="RS">Rio Grande do Sul</option>
        <option value="RO">Rondônia</option>
        <option value="RR">Roraima</option>
        <option value="SC">Santa Catarina</option>
        <option value="SP">São Paulo</option>
        <option value="SE">Sergipe</option>
        <option value="TO">Tocantins</option>
    </select>
    </div>

    <div class="form-group">
        <label for="cpf">CPF:</label>
        <input type="text" id="cpf" name="cpf" class="form-control" placeholder="Digite apenas números"/>
    </div>

    <div class="form-group">
        <label for="dataNascimento">Data de Nascimento:</label>
        <input type="date" id="dataNascimento" name="dataNascimento" class="form-control"/>
    </div>

    <div class="form-group">
        <label for="imagem">Imagem:</label>
        <input type="text" id="imagem" name="imagem" class="form-control" placeholder="Informe a url da sua foto"/>
    </div>

    <button id="button" type="submit" class="btn btn-dark btn-block">Salvar</button>
    <button id="btn-cancelar" type="button" class=" btn btn-dark btn-block">Cancelar</button>

    </div>

               <!-- Conexão com a api -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('editUser').addEventListener('submit', function (event) {
            event.preventDefault();

            var id = document.getElementById('id').value;
            var nome = document.getElementById('nome').value;
            var email = document.getElementById('email').value;
            var senha = document.getElementById('senha').value;
            var cep = document.getElementById('cep').value;
            var endereco = document.getElementById('endereco').value;
            var bairro = document.getElementById('bairro').value;
            var cidade = document.getElementById('cidade').value;
            var uf = document.getElementById('uf').value;
            var cpf = document.getElementById('cpf').value;
            var dataNascimento = document.getElementById('dataNascimento').value; // Já no formato yyyy-mm-dd
            var imagem = document.getElementById('imagem').value;

            var usuario = {
                Id: id,
                Nome: nome,
                Email: email,
                Senha: senha,
                CEP: cep,
                Endereco: endereco,
                Bairro: bairro,
                Cidade: cidade,
                UF: uf,
                CPF: cpf,
                DataNascimento: dataNascimento,
                Imagem: imagem
            };

            fetch('https://localhost:7178/api/Usuario', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(usuario)
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Erro na requisição: ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Requisição bem-sucedida:', data);
                    alert('Dados editados com sucesso!');
                    window.location.href = 'Default.aspx';
                })
                .catch(error => {
                    console.error('Erro ao editar usuário:', error);
                });
        });
        $('#btn-cancelar').on('click', function () {
            window.location.href = 'Default.aspx';
        });
    });

    
               </script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </form>
</body>
</html>
