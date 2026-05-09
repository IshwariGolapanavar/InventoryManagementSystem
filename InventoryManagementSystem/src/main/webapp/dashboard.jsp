<%@ page import="java.util.*, com.inventory.dao.ProductDAO, com.inventory.model.Product" %>

<%
ProductDAO dao = new ProductDAO();
List<Product> list = dao.getAllProducts();

String search = request.getParameter("search");
String categoryFilter = request.getParameter("category");

if(search != null || categoryFilter != null){

    List<Product> filtered = new ArrayList<>();

    for(Product p : list){

        boolean match = true;

        if(search != null && !search.isEmpty()){
            match = p.getName().toLowerCase().contains(search.toLowerCase());
        }

        if(categoryFilter != null && !categoryFilter.isEmpty()){
            match = match && p.getCategory().equalsIgnoreCase(categoryFilter);
        }

        if(match){
            filtered.add(p);
        }
    }

    list = filtered;
}
%>

<html>
<head>
<title>Inventory Dashboard</title>

<style>

/* 🌄 Background */
body{
    margin:0;
    font-family: Arial;
    background: url('smart.jpeg') no-repeat center center/cover;
}

/* Dark overlay */
.overlay{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.5);
    z-index:0;
}

/* 🌈 Title */
.header{
    text-align:center;
    font-size:32px;
    font-weight:bold;
    margin:20px 0;

    background: linear-gradient(45deg, #ff6a00, #ee0979, #00c6ff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;

    position:relative;
    z-index:1;
}

/* 🔍 Top bar */
.top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin:20px;
    position:relative;
    z-index:1;
}

/* search form */
.top-bar form{
    background: rgba(255,255,255,0.85);
    padding:10px;
    border-radius:10px;
    display:flex;
    gap:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.2);
}

.top-bar input,
.top-bar select{
    padding:8px;
    border-radius:5px;
    border:1px solid #ccc;
}

.top-bar button{
    padding:8px 15px;
    border:none;
    background: linear-gradient(45deg, #00c6ff, #0072ff);
    color:white;
    border-radius:5px;
    cursor:pointer;
}

/* add button */
.btn-add{
    background: linear-gradient(45deg, #2ecc71, #27ae60);
    color:white;
    padding:10px 15px;
    text-decoration:none;
    border-radius:8px;
}

/* 🌫️ GLASS BOX (IMPORTANT) */
.container{
    width:90%;
    margin:auto;
    padding:20px;
    border-radius:15px;

    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);

    border: 1px solid rgba(255,255,255,0.2);
    box-shadow:0 10px 25px rgba(0,0,0,0.3);

    position:relative;
    z-index:1;
}

/* table */
table{
    width:100%;
    border-collapse:collapse;
    color:white;
}

th{
    background: rgba(0,0,0,0.4);
    padding:12px;
}

td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid rgba(255,255,255,0.2);
}

/* hover */
tr:hover{
    background: rgba(255,255,255,0.1);
}

/* actions */
.delete{ color:#ff4d4d; text-decoration:none; }
.edit{ color:#4da6ff; text-decoration:none; }
.sell{ color:#2ecc71; text-decoration:none; }

.alert{
    color:#ff4d4d;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="overlay"></div>

<!-- 🌈 Title -->
<h1 class="header">INVENTORY MANAGEMENT SYSTEM</h1>

<!-- 🔍 Search Bar -->
<div class="top-bar">

    <form method="get">

        <input type="text" name="search" placeholder="Search product...">

        <select name="category">
            <option value="">All Categories</option>
            <option value="electronic">Electronic</option>
            <option value="grocery">Grocery</option>
            <option value="fashion">Fashion</option>
        </select>

        <button type="submit">Search</button>

    </form>

    <a href="addProduct.jsp" class="btn-add">+ Add Product</a>

</div>

<!-- 📦 Product Table -->
<div class="container">

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Category</th>
<th>Price</th>
<th>Stock</th>
<th>Actions</th>
</tr>

<%
for(Product p : list){
%>

<tr>
<td><%=p.getId()%></td>
<td><%=p.getName()%></td>
<td><%=p.getCategory()%></td>
<td><%=p.getPrice()%></td>

<td>
<%=p.getStock()%>
<% if(p.getStock() < 5){ %>
<span class="alert">Low Stock</span>
<% } %>
</td>

<td>
<a href="DeleteProductServlet?id=<%=p.getId()%>" class="delete">Delete</a>
<a href="editProduct.jsp?id=<%=p.getId()%>" class="edit">Edit</a>
<a href="sell.jsp?id=<%=p.getId()%>" class="sell">Sell</a>
</td>

</tr>

<%
}
%>

</table>

</div>

</body>
</html>