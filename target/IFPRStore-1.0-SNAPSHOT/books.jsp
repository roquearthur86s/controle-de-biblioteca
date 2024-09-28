<%@ page import="br.edu.ifpr.foz.ifprstore.models.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifpr.foz.ifprstore.DateUtils" %>
<%@ page import="br.edu.ifpr.foz.ifprstore.models.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% List<Book> books = (List<Book>) request.getAttribute("books"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Controle da biblioteca</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="css/dashboard.css">

</head>
<body class="bg-light">

<!-- Menu superior -->
<nav class="navbar navbar-expand-lg shadow-sm navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"> <img src="images/logo.png" alt="">Biblioteca do Rafael</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Livros</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Emprestados</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Relatórios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Configurações</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">

        <!-- Barra lateral -->
        <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar">
            <div class="position-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">
                            <span data-feather="home"></span>
                            Livros
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file"></span>
                            Alugueis
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="shopping-cart"></span>
                            Funcionarios
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="bar-chart-2"></span>
                            Relatórios
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="layers"></span>
                            Configurações de administrador
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Conteúdo principal -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">

            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Livros cadastrados na biblioteca</h1>

                <a class="btn btn-info" href="<%= request.getContextPath() %>/books/create">cadastrar</a>

            </div>

            <!-- Tabela de vendedores -->
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Titulo</th>
                        <th>Data de publicação</th>
                        <th>Autor</th>
                        <th>Status do livro</th>
                        <th>Ações</th>
                    </tr>
                    </thead>
                    <tbody>

                    <% for (Book book : books) {%>
                    <tr>
                        <td><%= book.getId() %></td>
                        <td><%= book.getName() %></td>
                        <td><%= DateUtils.brazilianDateFormat(book.getDate()) %></td>
                        <td><%= book.getAuthor().getName() %></td>
                        <td><%= book.getStatus() %></td>
                        <td>
                            <a href="<%= request.getContextPath() %>/books/delete?id=<%= book.getId() %>" class="btn btn-sm btn-danger">excluir</a>
                            <a href="<%= request.getContextPath() %>/books/update?id=<%= book.getId() %>" class="btn btn-sm btn-primary">editar</a>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>