import random
from PIL import Image

def rand(mode):
    return random.randint(0, 254)

def set_bit(value, bit):
    return value | (1<<bit)

def clear_bit(value, bit):
    return value & ~(1<<bit)

def process_image(input, output):
    plane = 6 #EDIT THIS FOR BIT PLANE ON RED
    with Image.open(input) as image:
        width, height = image.size
        new_image = Image.new("RGB", (width, height))
        for x in range(width):
            for y in range(height):
                pixel = image.getpixel((x, y))
                red = int(rand("any"))
                if pixel == (255, 255, 255): #white pixel
                    #red = set_bit(red,4)
                    red = set_bit(red,plane)
                    new_pixel = (red, rand("any"), rand("any"))
                else: #black pixel
                    #red = clear_bit(red,4)
                    red = clear_bit(red,plane)
                    new_pixel = (red, rand("any"), rand("any"))
                new_image.putpixel((x, y), new_pixel)
        new_image.save(output)

process_image("red.jpg", "red2.jpg")