import random
from PIL import Image

def process_image(input, output):
    with Image.open(input) as image:
        width, height = image.size
        new_image = Image.new("RGB", (width, height))
        for x in range(width):
            for y in range(height):
                pixel = image.getpixel((x, y))
                if pixel == (0, 0, 0): #black pixel
                    #make even red value
                    #for bit to end in 0
                    red = random.randint(0,254)
                    if red%2 == 1:
                        red+=1
                    new_pixel = (red,
                                 random.randint(0, 255),
                                 random.randint(0, 254))
                else: #white pixel
                    #make odd red value
                    #for bit to end in 1
                    red = random.randint(1,255)
                    if red%2 == 0:
                        red+=1
                    new_pixel = (red,
                                 random.randint(0, 255),
                                 random.randint(0, 255))
                new_image.putpixel((x, y), new_pixel)
        new_image.save(output)

process_image("red.jpg", "red2.jpg")