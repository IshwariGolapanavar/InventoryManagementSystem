<html>
<head>
<title>Login</title>

<style>
body{
    margin:0;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;

    /* 🌄 Background Image */
    background: url('IMS.jpeg') no-repeat center center/cover;
    font-family: Arial;
}

/* Dark overlay for readability */
.overlay{
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background: rgba(0,0,0,0.5);
}

.bg-text{
     position:relative;
    z-index:1;
    font-size:38px;
    font-weight:bold;
    margin-bottom:20px;

    background: linear-gradient(45deg, #ff6a00, #ee0979, yellow);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;

    letter-spacing:2px;
    text-align:Left;
}

/* Login Box */
.box{
    position:relative;
    z-index:1;
    background: rgba(200,200,255,0.2);
    backdrop-filter: blur(10px);
    padding:30px;
    width:300px;
    border-radius:12px;
    text-align:center;
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
    color:white;
}

h2{
    margin-bottom:20px;
}

input{
    width:100%;
    padding:10px;
    margin:10px 0;
    border:none;
    border-radius:6px;
    outline:none;
}

input[type="text"],
input[type="password"]{
    background: rgba(255,255,255,0.9);
}

button{
    width:100%;
    padding:10px;
    background: linear-gradient(45deg, #ff416c, #ff4b2b);
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:16px;
}

button:hover{
    transform: scale(1.05);
}
</style>

</head>

<body>

<div class="overlay"></div>

<div class="bg-text"><pre>
    INVENTORY 
           MANAGEMENT
                   SYSTEM
                </pre>
</div>
<div class="box">

<h2>Admin Login</h2>

<form action="LoginServlet" method="post">

    <input type="text" name="username" placeholder="Username" required>

    <input type="password" name="password" placeholder="Password" required>

    <button type="submit">Login</button>

</form>

</div>

</body>
</html>