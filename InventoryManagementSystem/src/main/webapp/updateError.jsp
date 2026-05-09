<html>
<head>
<title>Update Error</title>

<style>

body{
    margin:0;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    font-family: Arial;

    /* 🌄 background image */
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
.box{
    position:relative;
    z-index:1;
    text-align:center;
    padding:40px;
    border-radius:15px;

    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(10px);

    border:1px solid rgba(255,255,255,0.2);
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

/* BIG ERROR TEXT */
h1{
    font-size:40px;
    color:red;
    margin-bottom:10px;
}

p{
    font-size:18px;
    color:white;
}

/* button */
button{
    margin-top:20px;
    padding:12px 25px;
    border:none;
    border-radius:8px;

    background: linear-gradient(45deg, #ff416c, #ff4b2b);
    color:white;
    font-size:16px;
    cursor:pointer;
}

button:hover{
    transform:scale(1.05);
}

</style>

</head>

<body>

<div class="overlay"></div>

<div class="box">

    <h1>INVALID INPUT</h1>
    <p>Please fill all fields correctly</p>

   
 
</div>

</body>
</html>