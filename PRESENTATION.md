# Hiding Visual Data in Images

## Color Planes
A color plane displays only the Red, Green, or Blue pixels of an image. For example:

![image](https://github.com/Stuycs-K/final-project-4-yec-bidicaa/assets/90729548/b63c80d2-88e0-4d83-b588-66498ce8327f)
<img width="700" alt="image" src="https://github.com/Stuycs-K/final-project-4-yec-bidicaa/assets/90729548/7fe87aa2-f933-4966-8c12-6731dbf500ed">

Above we see the original image followed by its red, green, and blue color planes.

## Bit Planes
Bit planes are like color planes but split up into more planes. Instead of looking at the entire color value, a bit plane looks at a specific place value in the binary representation of a color value in the image's pixels.

![image](https://github.com/Stuycs-K/final-project-4-yec-bidicaa/assets/90729548/2a54384d-4884-4e6a-a661-f1a94d676525)

You may notice that as the bits get smaller, the image becomes less coherent. This is because with the bit size decreasing, more rgb values are likely to have a common bit value. This is why it's a good idea to hide images in smaller bit planes, otherwise you'll end up with something similar to the image below:

![image](https://github.com/Stuycs-K/final-project-4-yec-bidicaa/assets/90729548/f0ccc367-459e-4ff6-ae50-1fe1e111fd49)
 
