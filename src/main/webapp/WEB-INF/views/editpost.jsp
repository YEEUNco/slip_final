<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Edit Post</title>
</head>
<body>
<h1 class="text-center">중고거래 글 수정</h1>
<form class="w-50 m-auto" method="post" action="../editok" enctype="multipart/form-data">
	<input type="hidden" name="seq" value="${boardVO.seq}">
	<input type="hidden" name="oldfilename" value="${boardVO.image_url}">

	<div class="mb-3 row">
		<label for="productName" class="col-sm-2 col-form-label">Product Name</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="productName" name="productName" value="${boardVO.productName}">
		</div>
	</div>

	<div class="mb-3 row">
		<label for="price" class="col-sm-2 col-form-label">Price</label>
		<div class="col-sm-10">
			<input type="number" class="form-control" id="price" name="price" value="${boardVO.price}">
		</div>
	</div>

	<div class="mb-3 row">
		<label for="description" class="col-sm-2 col-form-label">Description</label>
		<div class="col-sm-10">
			<textarea class="form-control" id="description" name="description" rows="3">${boardVO.description}</textarea>
		</div>
	</div>

	<div class="mb-3 row">
		<label for="location" class="col-sm-2 col-form-label">Location</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="location" name="location" value="${boardVO.location}">
		</div>
	</div>

	<div class="mb-3 row">
		<label for="image_url" class="col-sm-2 col-form-label">Image</label>
		<div class="col-sm-10">
			<input class="form-control" type="file" id="image_url" name="image_url">
		</div>
	</div>

	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label">Condition:</label>
		<div class="col-sm-10">
			<input type="radio" id="conditionGood" name="prod_condition" value="좋음" ${boardVO.prod_condition == '좋음' ? 'checked' : ''}><label for="conditionGood">좋음</label>
			<input type="radio" id="conditionNormal" name="prod_condition" value="보통" ${boardVO.prod_condition == '보통' ? 'checked' : ''}><label for="conditionNormal">보통</label>
			<input type="radio" id="conditionBad" name="prod_condition" value="나쁨" ${boardVO.prod_condition == '나쁨' ? 'checked' : ''}><label for="conditionBad">나쁨</label>
		</div>
	</div>

	<div class="text-center">
		<input type="button" value="Back" onclick="history.back()" class="btn btn-secondary">
		<button type="submit" class="btn btn-primary">Edit post</button>
	</div>
</form>
</body>
</html>
<script>
	// JavaScript code if needed
</script>
