/**
 * 
 */
function proc(){
	let sum=0;	//함수에서 선언된 let은 끝까지 사용 가능
	let a=10;
	
	for(var i=0; i<5; i++){		//블럭 안에서 사용하면 var로 쓰면 함수영역 => 끝까지 사용가능 let => 블럭변수 : 블럭 안에서만(for문) 사용가능
		sum += 10;
	}
	
	let vres = document.getElementById('result');
	vres.innerText = i + " " + sum;				//여기서  i쓰려면 for문의 i는 var타입이어야 함
}

function calc(){
	var vqty = document.getElementById('qty').value;
	var vprice = document.getElementById('price').value;
	
	var res= vqty * vprice;
	
//	var str = "수량 : " + vqty + "<br>";
//	str += "가격 : " + vprice + "<br>";
//	str += "총금액 : " + res + "<br>";
	
	var str= `수량 : ${vqty} <br>`;
	str += `가격 : ${vprice} <br>`;
	str +=`총금액 : ${res} <br>`;
	
	console.log(str);
	 
	var vresult = document.getElementById('result');
	 
	vresult.innerHTML = str;
}