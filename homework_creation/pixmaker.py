import random
from PIL import Image
import math

'''
random number between 0 254
modes are even, odd, any
'''
def rand(mode):
    nums = random.randint(0, 254)
    if mode == "even":
        if nums %2 == 1:
            nums+=1
    elif mode == "odd":
        if nums %2 == 0:
            nums+=1
    else:
        return nums
    return nums

def process_image(input, output):
    with Image.open(input) as image:
        width, height = image.size
        new_image = Image.new("RGB", (width, height))
        for x in range(width):
            for y in range(height):
                pixel = image.getpixel((x, y))
                if pixel == (255, 255, 255): #white pixel
                    new_pixel = (rand("even"), rand("any"), rand("any"))
                else: #black pixel
                    new_pixel = (rand("odd"), rand("any"), int(rand("any")))
                new_image.putpixel((x, y), new_pixel)
        new_image.save(output)

process_image("red.jpg", "red2.jpg")