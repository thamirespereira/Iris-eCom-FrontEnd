<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadUsuario.aspx.cs" Inherits="IrisEComProjeto.WebForm1" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
     <link href="StyleSheet.css" rel="stylesheet"/>
    <title>Cadastrar</title>
</head>
<body>

    <form id="cadUsuario">
        <div class="container mt-5">
        <h2 class="mb-4">Cadastre-se</h2>
        <div class="form-group">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" class="form-control"/>
        </div>

        <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" class="form-control"/>
        </div>

        <div class="form-group">
        <label for="senha">Senha:</label>
        <input type="text" id="senha" name="senha" class="form-control"/>
        </div>

        <div class="form-group">
        <label for="cep">CEP:</label>
        <input type="text" id="cep" name="cep" class="form-control"/>
        </div>

        <div class="form-group">
        <label for="endereco">Endereço:</label>
        <input type="text" id="endereco" name="endereco" class="form-control"/>
        </div>

        <div class="form-group">
        <label for="bairro">Bairro:</label>
        <input type="text" id="bairro" name="bairro" class="form-control"/>
        </div>

        <div class="form-group">
        <label for="cidade">Cidade:</label>
        <input type="text" id="cidade" name="cidade" class="form-control"/>
        </div>

        <div class="form-group">
        <label for="uf">UF:</label>
        <input type="text" id="uf" name="uf" class="form-control"/>
        </div>

        <div class="form-group">
        <label for="cpf">CPF:</label>
        <input type="text" id="cpf" name="cpf" class="form-control"/>
        </div>

        <div class="form-group">
        <label for="dataNascimento">Data de Nascimento:</label>
        <input type="date" id="dataNascimento" name="dataNascimento" class="form-control"/>
        </div>

        <div class="form-group">
        <label for="imagem">Imagem:</label>
        <input type="text" id="imagem" name="imagem" class="form-control"/>
        </div>
    
        <button id="button" type="submit" class="btn btn-primary btn-block">Cadastrar</button>
        <button id="btn-voltar" type="button" class=" btn btn-primary btn-block">Voltar</button>

        </div>
       <!-- Conexão com a api -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('cadUsuario').addEventListener('submit', function (event) {
            event.preventDefault();

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
                Nome: nome,
                Email: email,
                Senha: senha,
                CEP: cep,
                Endereço: endereco,
                Bairro: bairro,
                Cidade: cidade,
                UF: uf,
                CPF: cpf,
                DataNascimento: dataNascimento,
                Imagem: imagem
            };

            fetch('https://localhost:7178/api/Usuario', {
                method: 'POST',
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
                    alert('Usuário adicionado com sucesso!');
                })
                .catch(error => {
                    console.error('Erro ao adicionar usuário:', error);
                });
        });
        document.getElementById('btn-voltar').addEventListener('click', function () {
            window.history.back();
        });
    });
       </script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </form>
        
</body>
</html>
