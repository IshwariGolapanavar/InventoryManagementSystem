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
<title>Sell Product</title>

<style>

/* 🌄 Background */
body{
    margin:0;
    height:100vh;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    font-family: Arial;

    background: url('smart.jpeg') no-repeat center center/cover;
    position:relative;
}

/* dark overlay */
.overlay{
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.5);
    z-index:0;
}

/* 🌈 Title ABOVE box */
.title{
    position:relative;
    z-index:1;
    font-size:28px;
    font-weight:bold;
    margin-bottom:20px;
    text-align:center;

    background: linear-gradient(45deg, #ff6a00, #ee0979,yellow);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;

    letter-spacing:2px;
}

/* 🌫️ Glass Box */
.box{
    position:relative;
    z-index:1;

    width:350px;
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

/* text */
p{
    margin:8px 0;
}

/* input */
input{
    width:100%;
    padding:10px;
    margin-top:10px;
    border:none;
    border-radius:6px;
    outline:none;
    background: rgba(255,255,255,0.9);
}

/* button */
button{
    width:100%;
    padding:10px;
    margin-top:15px;
    border:none;
    border-radius:6px;

    background: linear-gradient(45deg, #00c853, #64dd17);
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    transform: scale(1.05);
}

/* error */
.error{
    color:#ff4d4d;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="overlay"></div>

<!-- 🌈 TITLE -->
<div class="title">
    INVENTORY MANAGEMENT SYSTEM
</div>

<!-- 🌫️ BOX -->
<div class="box">

<h2>Sell Product</h2>

<% if(p != null){ %>

<form action="SellProductServlet" method="post">

    <input type="hidden" name="id" value="<%=p.getId()%>">

    <p><b>Name:</b> <%=p.getName()%></p>
    <p><b>Stock:</b> <%=p.getStock()%></p>

    <input type="number" name="qty" placeholder="Enter Quantity" required>

    <button type="submit">Sell Product</button>

</form>

<% } else { %>

<p class="error">Product not found</p>

<% } %>

</div>

</body>
</html>