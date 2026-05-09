<html>
<head>
<title>Login Error</title>

<style>

body{
    margin:0;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    font-family: Arial;

    /* 🌄 Background image */
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
    background:rgba(0,0,0,0.6);
}

/* error box */
.error-box{
    position:relative;
    z-index:1;
    text-align:center;

    padding:30px;
    border-radius:12px;

    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(10px);

    border:1px solid rgba(255,255,255,0.2);
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

/* error text */
.error-text{
    font-size:22px;
    font-weight:bold;
    color:red;
}

/* button */
button{
    margin-top:15px;
    padding:10px 20px;
    border:none;
    border-radius:6px;
    background: linear-gradient(45deg, #ff416c, #ff4b2b);
    color:white;
    cursor:pointer;
}

button:hover{
    transform:scale(1.05);
}

</style>

</head>

<body>

<div class="overlay"></div>

<div class="error-box">

    <div class="error-text">
         Invalid Username or Password
    </div>

    <form action="login.jsp">
        <button type="submit">Try Again</button>
    </form>

</div>

</body>
</html>