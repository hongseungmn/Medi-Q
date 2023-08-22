<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/gh/marshallku/infinite-scroll/dist/infiniteScroll.min.js"></script>
<script src="https://unpkg.com/three"></script>
<script src="https://unpkg.com/three-spritetext"></script>
<script src="https://unpkg.com/3d-force-graph"></script>
</head>
<body>
<div id="3d-graph" style="width:100%;height:100%;"></div>

   <script>
  let Graph = ForceGraph3D()
    (document.getElementById('3d-graph'))
      .jsonUrl('http://192.168.0.16/review/${no}')
      .nodeAutoColorBy('group')
      .width("1000")
      .height("3000")
      .linkWidth(0.2)
      .linkAutoColorBy("value")
      .backgroundColor("white")
      .nodeThreeObject(node => {
        const sprite = new SpriteText(node.id);
        sprite.material.depthWrite = false; // make sprite background transparent
        if(node.group==3) {
          sprite.color = "#2803ff";
          if(node.val <=5) {
            sprite.textHeight = node.val;
          }
          else if(node.val <= 10 && node.val > 5) {
            sprite.textHeight = node.val/3;
          }
          else if(node.val > 15) {
            sprite.textHeight = node.val/5;
          }
          
        }
        else if(node.group==1) {
          sprite.color = "#ff3d3d";
          if(node.val <=5) {
            sprite.textHeight = node.val+5;
          }
          else if(node.val <= 10 && node.val > 5) {
            sprite.textHeight = node.val/2;
          }
          else if(node.val > 15) {
            sprite.textHeight = node.val/3;
          }
        }
        else {
          sprite.color = "#335504";
          sprite.textHeight = 10;
        }
        return sprite;
      });

  // Spread nodes a little wider
  Graph.d3Force('charge').strength(-80);
</script>
</body>
</html>