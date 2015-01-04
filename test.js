document.getElementById("muteButton").onclick = function () { 
	if (document.getElementById("muteButton").value == 'Mute'){
		document.getElementById("muteButton").value = 'Unmute';
	}
	else{
		document.getElementById("muteButton").value = 'Mute';
	}	
};


document.getElementById("playSong").onclick = function () { 
	if (document.getElementById("playSong").value == 'Play Song'){
		document.getElementById("playSong").value = 'Stop Song';
	}
	else{
		document.getElementById("playSong").value = 'Play Song';
	}	
};

function code(e) {
    e = e || window.event;
    return(e.keyCode || e.which);
}

var player;
var isPlayingMusic = "NO";
var swipeIndex = 0
function Sound(source,volume,loop)
{
    this.source=source;
    this.volume=volume;
    this.loop=loop;
    var son;
    this.son=son;
    this.finish=false;
    this.stop=function()
    {
        document.body.removeChild(this.son);
    }
    this.start=function()
    {
        if(this.finish)return false;
        this.son=document.createElement("embed");
        this.son.setAttribute("src",this.source);
        this.son.setAttribute("hidden","true");
        this.son.setAttribute("volume",this.volume);
        this.son.setAttribute("autostart","true");
        this.son.setAttribute("loop",this.loop);
        document.body.appendChild(this.son);
    }
    this.remove=function()
    {
        document.body.removeChild(this.son);
        this.finish=true;
    }
    this.init=function(volume,loop)
    {
        this.finish=false;
        this.volume=volume;
        this.loop=loop;
    }
}

window.onload = function(){
    document.onkeypress = function(e){
        var key = code(e);
        console.log("key = " + key);

        // mute button 'a' key
        if (key == 97)
        {
        	console.log('Mute');
        }

        // play song button 'q' key
        if (key == 113)
        {
        	if (isPlayingMusic == "NO")
        	{
        		console.log("Play ACDC: Shoot to Thrill");
        		isPlayingMusic = "YES";
        		player = new Sound("https://s3.amazonaws.com/happinessapps/acdc.mp3", -1.00, false);
        		player.start();
        	}
        	else
        	{
        		console.log('Stop Streaming ACDC: Shoot to Thrill');
        		player.stop();
        		isPlayingMusic = "NO"
        	}
        	
        }

        // volume hold button 'w' key
        if (key == 119)
        {
        	
        	player.volume = player.volume + 0.5;
        	console.log('Crank Up Volume');
        }

        // volume hold button 'x' key
        if (key == 120)
        {
        	
        	player.volume = player.volume - 0.5;
        	console.log('Lower Volume');
        }

        // swipe left 's' key
        if (key == 115)
        {
        	console.log('Swipe Left');
        	swipeIndex--;
        	if (swipeIndex <=0)
        	{
        		document.getElementById("imgFile").src = "http://santamonicacentric.com/site/wp-content/uploads/2014/07/internet-famous-grumpy-cat-just-landed-an-endorsement-deal-with-friskies.jpg"
        		swipeIndex = 0;
        	}

        	if (swipeIndex == 1)
        	{
        		document.getElementById("imgFile").src = "http://www.hollywoodreporter.com/sites/default/files/imagecache/modal_800/2014/09/too_good_for_grumpy_cat.jpg"
        	}

        	if (swipeIndex >= 2)
        	{
        		document.getElementById("imgFile").src = "http://rack.0.mshcdn.com/media/ZgkyMDEzLzA3LzI5LzU1L2dydW1weWNhdC5kZmM3MC5wbmcKcAl0aHVtYgkxMjAweDYyNyMKZQlqcGc/f780e423/c84/grumpycat.jpg"
        		swipeIndex = 2;
        	}
        }

        // swipe right 'd' key
        if (key == 100)
        {
        	console.log('Swipe Right');
        	swipeIndex++;
        	if (swipeIndex <=0)
        	{
        		document.getElementById("imgFile").src = "http://santamonicacentric.com/site/wp-content/uploads/2014/07/internet-famous-grumpy-cat-just-landed-an-endorsement-deal-with-friskies.jpg"
        		swipeIndex = 0;
        	}

        	if (swipeIndex == 1)
        	{
        		document.getElementById("imgFile").src = "http://www.hollywoodreporter.com/sites/default/files/imagecache/modal_800/2014/09/too_good_for_grumpy_cat.jpg"
        	}

        	if (swipeIndex >= 2)
        	{
        		document.getElementById("imgFile").src = "http://rack.0.mshcdn.com/media/ZgkyMDEzLzA3LzI5LzU1L2dydW1weWNhdC5kZmM3MC5wbmcKcAl0aHVtYgkxMjAweDYyNyMKZQlqcGc/f780e423/c84/grumpycat.jpg"
        		swipeIndex = 2;
        	}

        }
    };
};