package com.athena.ck.common.barcode;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;

public class ImgCreator
{

    private Image img;
    public Graphics g;

    public ImgCreator()
    {
    }

    public Image getImage(int i, int j)
    {
        int k = j <= i ? i : j;
        img = new BufferedImage(k, k, 10);
        g = ((BufferedImage)img).createGraphics();
        return img;
    }

    public Graphics getGraphics()
    {
        return g;
    }
}
