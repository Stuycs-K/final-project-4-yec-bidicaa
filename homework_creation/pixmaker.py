import random
from PIL import Image

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

def set_bit(value, bit):
    return value | (1<<bit)

def clear_bit(value, bit):
    return value & ~(1<<bit)

def process_image(input, output):
    with Image.open(input) as image:
        width, height = image.size
        new_image = Image.new("RGB", (width, height))
        for x in range(width):
            for y in range(height):
                pixel = image.getpixel((x, y))
                red = 255#int(rand("any"))
                if pixel == (255, 255, 255): #white pixel
                    new_pixel = (red, 255, 255)
                    #new_pixel = (set_bit(red, 4), rand("any"), rand("any"))
                else: #black pixel
                    new_pixel = (clear_bit(red, 1), 255, 255)
                new_image.putpixel((x, y), new_pixel)
        new_image.save(output)

process_image("red.jpg", "red2.jpg")