<%@ page import="com.inventory.dao.ProductDAO, com.inventory.model.Product" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
ProductDAO dao = new ProductDAO();

Product p = null;

for(Product prod : dao.getAllProducts()){
    if(prod.getId() == id){
        p = prod;
        break;
    }
}
%>

<html>
<head>
<title>Edit Product</title>

<style>

/* 🌄 Background */
body{
    margin:0;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    font-family: Arial;

    background: url('smart.jpeg') no-repeat center center/cover;
    position:relative;
}

/* Dark overlay */
.overlay{
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.5);
    z-index:0;
}

/* 🌫️ Glass box */
.container{
    position:relative;
    z-index:1;

    width:420px;
    padding:25px;
    border-radius:15px;
    text-align:center;

    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);

    border: 1px solid rgba(255,255,255,0.2);
    box-shadow:0 10px 25px rgba(0,0,0,0.3);

    color:white;
}

/* Title */
h2{
    margin-bottom:15px;
}

/* Inputs */
input{
    width:100%;
    padding:10px;
    margin:8px 0;
    border:none;
    border-radius:6px;
    outline:none;
}

/* Light input style */
input[type="text"],
input[type="number"]{
    background: rgba(255,255,255,0.9);
}

/* Button */
button{
    width:100%;
    padding:10px;
    margin-top:10px;
    border:none;
    border-radius:6px;

    background: linear-gradient(45deg, #ff8c00, #ff2e63);
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    transform: scale(1.05);
}

/* error text */
.error{
    color:#ff4d4d;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="overlay"></div>

<div class="container">

<h2>Edit Product</h2>

<% if(p != null){ %>

<form action="UpdateProductServlet" method="post">

    <input type="hidden" name="id" value="<%=p.getId()%>">

    <input type="text" name="name" value="<%=p.getName()%>">

    <input type="text" name="category" value="<%=p.getCategory()%>">

    <input type="number" name="price" value="<%=p.getPrice()%>">

    <input type="number" name="stock" value="<%=p.getStock()%>">

    <button type="submit">Update Product</button>

</form>

<% } else { %>

<p class="error">Product not found</p>

<% } %>

</div>

</body>
</html>