/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function getProducts(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("myProduct");
        if (d !== null) // Da truyen duoc du lieu
        {
            let h = "";
            for (let i = 0; i < data.length; i++) {
                h += `
                    <tr>
                        <td><img src="${data[i].image}" width="120" /></td>
                        <td>${data[i].name}</td>
                        <td>${data[i].price}</td>
                        <td><button class="btn btn-danger">Xóa</button></td>
                    </tr>`
            d.innerHTML = h;
            }
        }
        let d2 = document.getElementById("mySpinner");
        d2.style.display = "none";
    }).then(function (err) {
        console.error(err);
    })
}

