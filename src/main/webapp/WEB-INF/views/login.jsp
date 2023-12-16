<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-container {
            width: 400px;
            margin: 100px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-logo img {
            width: 200px; /* 로고 이미지 크기 조정 */
        }

        .login-form label {
            font-weight: bold;
        }

        .login-button {
            background-color: #82c1f5;
            color: white;
            font-size: 15px;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-logo">
        <img src="https://github.com/SionLee21/project5/assets/121320706/bf601ede-5fca-40b3-8427-cac5b610e82f" alt="logo"> <!-- 로고 이미지 URL -->
    </div>
    <form class="login-form" method="post" action="loginOk">
        <div class="form-group">
            <label>User ID:</label>
            <input type="text" class="form-control" name="userid">
        </div>
        <div class="form-group">
            <label>Password:</label>
            <input type="password" class="form-control" name="password">
        </div>
        <button type="submit" class="btn login-button">Login</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
