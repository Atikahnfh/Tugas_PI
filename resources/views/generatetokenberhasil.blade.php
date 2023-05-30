<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

        <title>Generate Token Beasiswa API</title>
    </head>
    <body>
        <div class="container-fluid bg-dark">
            <div class="container bg-primary">
                <p class="display-2 text-light py-2"><strong>BEASISWA API</strong></p>
            </div>

            <div class="container bg-info py-4">
                <p class="display-5  text-light mb-2">Get API key</p>

                <p class="display-6">Key telah dibuat!</p>
                @if(isset($tokenget))          
                <p class="h4">Key : {{$tokenget}}</p>
                @endif
                <p class="h5">Jangan lupa yaa. Make something amazing!</p>

            </div>
        </div>

        
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>