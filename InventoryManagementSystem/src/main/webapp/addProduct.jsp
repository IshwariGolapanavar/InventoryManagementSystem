<html>
<head>
<title>Add Product</title>

<style>
body{
    font-family: Arial;
    margin: 0;
    padding: 0;

    /* Background Image */
    background: url("smart.jpeg") no-repeat center center/cover;
    height: 100vh;
}

/* Center container */
.container{
    width: 400px;
    margin: 80px auto;
    padding: 25px;
    
    /* Transparent effect */
    background: rgba(255,255,255,0.2);
    backdrop-filter: blur(8px);
    border-radius: 12px;
    box-shadow: 0 0 15px rgba(0,0,0,0.3);
}

/* Title */
h1{
    text-align: center;
    font-size: 28px;
    margin-top: 30px;
    background: linear-gradient(to right, red, orange, green, blue, purple);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* Form heading */
h2{
    text-align: center;
    color: white;
}

/* Inputs */
input{
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border: none;
    border-radius: 5px;
    outline: none;
}

/* Button */
button{
    width: 100%;
    padding: 10px;
    background: linear-gradient(to right, #28a745, #00c853);
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
}

button:hover{
    opacity: 0.9;
}
</style>

</head>

<body>

<h1>Inventory Management System</h1>

<div class="container">

<h2>Add Product</h2>

<form action="AddProductServlet" method="post">

    <input type="text" name="name" placeholder="Product Name" required>

    <input type="text" name="category" placeholder="Category" required>

    <input type="number" name="price" placeholder="Price" required>

    <input type="number" name="stock" placeholder="Stock" required>

    <button type="submit">Add Product</button>

</form>

</div>

</body>
</html>