function loadCat(catId) {
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("content").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "phpAction/catSelectAction.php?id="+catId, true);
    xhttp.send();   
}

function loadKw(keyword) {
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("content").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "phpAction/kwLookUp.php?kw="+keyword, true);
    xhttp.send();   
}

function loadAcc(accId) {
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("content").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "phpAction/accSelectAction.php?id="+accId, true);
    xhttp.send();   
}

function loadBreadCrumCat(catId) {
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("breadcrumb").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "phpAction/breadcrumCatAction.php?id="+catId, true);
    xhttp.send();   
}

function loadBreadCrumAcc(accId) {
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("breadcrumb").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "phpAction/breadcrumAccAction.php?id="+accId, true);
    xhttp.send();   
}

function sorting(key) {
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            
            if(this.responseText != ''){
                document.getElementById("content").innerHTML = this.responseText;
            }
            
        }
    };
    xhttp.open("GET", "phpAction/sorting.php?key="+key, true);
    xhttp.send();   
}

function ordering(key) {
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            
            if(this.responseText != ''){
                document.getElementById("content").innerHTML = this.responseText;
            }
            
        }
    };
    xhttp.open("GET", "phpAction/ordering.php?key="+key, true);
    xhttp.send();   
}