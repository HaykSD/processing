def distanse(a, b):
    dx = b[0] - a[0]
    dy = b[1] - a[1]
    return (dx ** 2 + dy ** 2) ** 0.5

def lerp(a, b, t):
    return (1 - t) * a + b * t

def invLerp(a, b, v):
    return (v - a) / (b - a)

def remap(v, v_min, v_max, to_min, to_max):
    t = invLerp(v_min, v_max, v)
    return lerp(to_min, to_max, t)



def setup():
    size(300, 291)
    global img
    img = loadImage("fox.jpg")
    imgt = loadImage("f.jpg")
    # noLoop()


def draw():
    loadPixels()
    image(img, 0, 0)
    for x in range(width):
        for y in range(height):
            loc = x+y*width
            r,g,b = red(img.pixels[loc]),green(img.pixels[loc]),blue(img.pixels[loc])
            d=dist(x,y,mouseX,mouseY)/map(mouseY,0,291,5,0.01)
            # d=dist(x,y,mouseX,mouseY)/0.5
            pixels[loc] = color(r-d**3,g-d**3,b-d**3)
    updatePixels()


        
