
//Should spin in respect to axel
spa = argument0;

//Angle direction in respect to camera
aort = -darctan2(zgrav,xgrav);
if zgrav >= 0
    aort += 360;
/*if (aort!=360) switch ort
{   case 2:     if aort == 270
                    ort = 5;
                else if aort > 270
                    ort = 4;
                else if (aort<270) and (aort>180)
                    ort = 3;
                break;
    case 3:     if aort == 0
                    ort = 4;
                else if aort < 90
                    ort = 2;
                else if aort > 270
                    ort = 5;
                break;
    case 4:     if aort == 180
                    ort = 3;
                else if (aort>90) and (aort<270)
                {   if aort < 180
                        ort = 2;
                    else
                        ort = 5;
                }
                break;
    case 5:     if aort == 90
                    ort = 2;
                else if aort < 180
                {   if aort > 90
                        ort = 3;
                    else
                        ort = 4;
                }
                break;
}*/
if (aort!=360 and aort!=180) switch ort
{   case 2:     if (aort>135) and (aort<225)
                    ort = 3;
                else if (aort>=225) and (aort<=315)
                    ort = 5;
                else if (aort>315) or (aort<45)
                    ort = 4;
                break;
                
    case 3:     if (aort>225) and (aort<315)
                    ort = 5;
                else if (aort>=315) or (aort<=45)
                    ort = 4;
                else if (aort>45) and (aort<135)
                    ort = 2;
                break;
                
    case 4:     if (aort>45) and (aort<135)
                    ort = 2;
                else if (aort>=135) and (aort<=225)
                    ort = 3;
                else if (aort>225) and (aort<315)
                    ort = 5;
                break;
                
    case 5:     if (aort>315) or (aort<45)
                    ort = 4;
                else if (aort>=45) and (aort<=135)
                    ort = 2;
                else if (aort>135) and (aort<225)
                    ort = 3;
                break;
}

//Speed and collision setup in respect to top
switch (qspin)
{   case 1:     hme = x2;
                hec = 0;
                htm = 0;
                vme = z2;
                vec = 1;
                vtm = 0;
                gme = y2;
                gec = 2;
                gtm = 0;
                xspeed = xgrav;
                zspeed = zgrav;
                yspeed = ygrav;
                hnew = xspeed;
                vnew = zspeed;
                gnew = yspeed;
                nort = ort;
                break;
                
    case 2:     hme = x2;
                hec = 0;
                htm = 0;
                vme = y;
                vec = 2;
                vtm = 1;
                gme = z2;
                gec = 1;
                gtm = 0;
                xspeed = xgrav;
                yspeed = -zgrav;
                zspeed = ygrav;
                hnew = xspeed;
                vnew = yspeed;
                gnew = zspeed;
                if ort == 2
                    nort = 6;
                else if ort == 5
                    nort = 1;
                else
                    nort = ort;
                break;
                
    case 3:     hme = y;
                hec = 2;
                htm = 1;
                vme = z2;
                vec = 1;
                vtm = 0;
                gme = x2;
                gec = 0;
                gtm = 0;
                yspeed = -xgrav;
                zspeed = zgrav;
                xspeed = ygrav;
                hnew = yspeed;
                vnew = zspeed;
                gnew = xspeed;
                if ort == 3
                    nort = 6;
                else if ort == 4
                    nort = 1;
                else
                    nort = ort;
                break;
                
    case 4:     hme = y2;
                hec = 2;
                htm = 0;
                vme = z2;
                vec = 1;
                vtm = 0;
                gme = x;
                gec = 0;
                gtm = 1;
                yspeed = xgrav;
                zspeed = zgrav;
                xspeed = -ygrav;
                hnew = yspeed;
                vnew = zspeed;
                gnew = xspeed;
                if ort == 3
                    nort = 1;
                else if ort == 4
                    nort = 6;
                else
                    nort = ort;
                break;
                
    case 5:     hme = x2;
                hec = 0;
                htm = 0;
                vme = y2;
                vec = 2;
                vtm = 0;
                gme = z;
                gec = 1;
                gtm = 1;
                xspeed = xgrav;
                yspeed = zgrav;
                zspeed = -ygrav;
                hnew = xspeed;
                vnew = yspeed;
                gnew = zspeed;
                if ort == 2
                    nort = 1;
                else if ort == 5
                    nort = 6;
                else
                    nort = ort;
                break;
                
    case 6:     hme = x;
                hec = 0;
                htm = 1;
                vme = z2;
                vec = 1;
                vtm = 0;
                gme = y;
                gec = 2;
                gtm = 1;
                xspeed = -xgrav;
                zspeed = zgrav;
                yspeed = -ygrav;
                hnew = xspeed;
                vnew = zspeed;
                gnew = yspeed;
                if ort == 3
                    nort = 4;
                else if ort == 4
                    nort = 3;
                else
                    nort = ort;
                break;
}

//New position during axel spin
if qspin2 != qspin
{   switch qspin2
    {   case 1: y += 2*(32+sq/2) * spa;
        case 6: y -= (32+sq/2) * spa;
                if (nort==2) or (nort==5)
                {   qdiff = ((spx+96) - (x+(sq/2))) * spa;
                    x += qdiff;
                }
                else
                {   qdiff = ((spz+96) - (z+(sq/2))) * spa;
                    z += qdiff;
                }
                if qspin2 == 6
                    qdiff *= -1;
                break;
                
        case 2: z += 2*(32+sq/2) * spa;
        case 5: z -= (32+sq/2) * spa;
                if (ort==2) or (ort==5)
                {   qdiff = ((spx+96) - (x+sq/2)) * spa;
                    x += qdiff;
                    if qspin2 == ort
                        nort = 6;
                    else
                        nort = 1;
                }
                else
                {   qdiff = ((spy+96) - (y+sq/2)) * spa;
                    y += qdiff;
                }
                if qspin2 == 5
                    qdiff *= -1;
                break;
                
        case 3: x += 2*(32+sq/2) * spa;
        case 4: x -= (32+sq/2) * spa;
                if (ort==3) or (ort==4)
                {   qdiff = ((spz+96) - (z+sq/2)) * spa;
                    z += qdiff;
                    if qspin2 == ort
                        nort = 6;
                    else
                        nort = 1;
                }
                else
                {   qdiff = ((spy+96) - (y+sq/2)) * spa;
                    y += qdiff;
                }
                if qspin2 == 4
                    qdiff *= -1;
                break;
    }
    
    switch qspin
    {   case 1: y -= 2*(32+sq/2) * spa;
                qdiff *= -1;
        case 6: y += (32+sq/2) * spa;
                if (nort==2) or (nort==5)
                    x -= qdiff;
                else
                    z -= qdiff;
                break;
                
        case 2: z -= 2*(32+sq/2) * spa;
                qdiff *= -1;
        case 5: z += (32+sq/2) * spa;
                if (nort==1) or (nort==6)
                {   x -= qdiff;
                    if qspin == 2
                    {   if nort == 1
                            ort = 5;
                        else
                            ort = 2;
                    }
                    else
                    {   if nort == 1
                            ort = 2;
                        else
                            ort = 5;
                    }
                }
                else
                    y -= qdiff;
                break;
                
        case 3: x -= 2*(32+sq/2) * spa;
                qdiff *= -1;
        case 4: x += (32+sq/2) * spa;
                if (nort==1) or (nort==6)
                {   z -= qdiff;
                    if qspin == 3
                    {   if nort == 1
                            ort = 4;
                        else
                            ort = 3;
                    }
                    else
                    {   if nort == 1
                            ort = 3;
                        else
                            ort = 4;
                    }
                }
                else
                    y -= qdiff;
                break;
    }
}

//Collision reduction checking, from x to z to y to win to slopes
cub = ds_list_create();
ds_list_copy(cub,sculptor.cub);

xchk = ds_list_create();
for (var i=0;i<ds_list_size(cub);i++)
{   e = cub[|i];
    if (x+xspeed<e[0,1]) and (x2+xspeed>e[0,0])
        ds_list_add(xchk,e);
    else if (gec==0) and (x<e[0,1]) and (x2>e[0,0])
        ds_list_add(xchk,e);
}

zchk = ds_list_create();
for (i=0;i<ds_list_size(xchk);i++)
{   e = xchk[|i];
    if (z+zspeed<e[1,1]) and (z2+zspeed>e[1,0])
        ds_list_add(zchk,e);
    else if (gec==1) and (z<e[1,1]) and (z2>e[1,0])
        ds_list_add(zchk,e);
}

ychk = ds_list_create();
for (i=0;i<ds_list_size(zchk);i++)
{   e = zchk[|i];
    if (y+yspeed<e[2,1]) and (y2+yspeed>e[2,0])
    {   ds_list_add(ychk,e);
        e[3].top = 4;
    }
    else if (gec==2) and (y<e[2,1]) and (y2>e[2,0])
    {   ds_list_add(ychk,e);
        e[3].top = 4;
    }
}

wchk = 0;
for (i=ds_list_size(ychk);i>0;i--)
{   e = ychk[|i-1];
    if e[3].object_index == asset_get_index("next_b")
    {   wchk = e;
        ds_list_delete(ychk,i-1);
    }
}

gchk = ds_list_create();
var add_to_g2 = 0;
for (i=ds_list_size(ychk);i>0;i--)
{   var add_to_g = 0;
    e = ychk[|i-1];
    if !gtm
    {   if !(gme-8 <= e[gec,gtm])
            add_to_g = 1;
    }
    else if !(gme+8 >= e[gec,gtm])
        add_to_g = 1;
    
    if !add_to_g for (var j=ds_list_size(ychk);j>0;j--)
    {   c = ychk[|j-1];
        if (e[3]!=c[3]) and (e[gec,gtm]!=c[gec,gtm])
        and ((c[0,0]>=e[0,0] and c[0,1]<=e[0,1]) and (c[1,0]>=e[1,0] and c[1,1]<=e[1,1])
        or (c[0,0]>=e[0,0] and c[0,1]<=e[0,1]) and (c[2,0]>=e[2,0] and c[2,1]<=e[2,1])
        or (c[2,0]>=e[2,0] and c[2,1]<=e[2,1]) and (c[1,0]>=e[1,0] and c[1,1]<=e[1,1]))
        {   if (x<c[0,0]) and (x2<=c[0,0])
                wplane = (e[0,0]==c[0,0]);
            else if (x>=c[0,1]) and (x2>c[0,1])
                wplane = (e[0,1]==c[0,1]);
            else if (z<c[1,0]) and (z2<=c[1,0])
                wplane = (e[1,0]==c[1,0]);
            else if (z>=c[1,1]) and (z2>c[1,1])
                wplane = (e[1,1]==c[1,1]);
            else if (y<c[2,0]) and (y2<=c[2,0])
                wplane = (e[2,0]==c[2,0]);
            else if (y>=c[2,1]) and (y2>c[2,1])
                wplane = (e[2,1]==c[2,1]);
            if wplane
            {   if !gtm
                {   if !(e[gec,gtm]-8 < c[gec,gtm+1-1])
                    {   add_to_g = 1;
                        break;
                    }
                }
                else if !(e[gec,gtm]+8 > c[gec,gtm-1+1])
                {   add_to_g = 1;
                    break;
                }
            }
        }
    }
    add_to_g2 |= add_to_g<<(i-1);
}
if add_to_g2 for (i=ds_list_size(ychk);i>0;i--)
{   if (add_to_g2>>(i-1))&1
    {   ds_list_add(gchk,ychk[|i-1]);
        ds_list_delete(ychk,i-1);
    }
}

gold = 0;
hold = 0;
vold = 0;
ds_list_clear(xchk);
ds_list_clear(zchk);
spbb = 0;

//Collision 2D detection, sides
if ds_list_size(gchk)
{   if hnew*(-2*htm+1) < 0
    {   hme = hme + sq*(2*htm-1);
        htm = 1 - htm;
    }
    if vnew*(-2*vtm+1) < 0
    {   vme = vme + sq*(2*vtm-1);
        vtm = 1 - vtm;
    }
    
    e = gchk[|0];
    hdiff = e[hec,htm] - hme;
    vdiff = e[vec,vtm] - vme;
    if abs(hdiff) < abs(hnew)
        hnew = hdiff;
    if abs(vdiff) < abs(vnew)
        vnew = vdiff;
    
    if ds_list_size(gchk) > 1
    {   hplane = e[hec,htm];
        vplane = e[vec,vtm];
        gtplane = e[gec,gtm];
        gbplane = e[gec,1-gtm];
        for (i=1;i<ds_list_size(gchk);i++)
        {   e = gchk[|i];
            hdiff = e[hec,htm] - hme;
            vdiff = e[vec,vtm] - vme;
            
            if !(vplane==e[vec,vtm] and (gbplane==e[gec,1-gtm] or gtplane==e[gec,gtm]))
            //and !(gbplane==e[gec,gtm] or gtplane==e[gec,1-gtm])
            {   if abs(hdiff) < abs(hnew)
                    hnew = hdiff;
                hold = -1;
            }
            else if (hold != -1)
                hold = 1;
            
            if !(hplane==e[hec,htm] and (gbplane==e[gec,1-gtm] or gtplane==e[gec,gtm]))
            //and !(gbplane==e[gec,gtm] or gtplane==e[gec,1-gtm])
            {   if abs(vdiff) < abs(vnew)
                    vnew = vdiff;
                vold = -1;
            }
            else if (vold != -1)
                vold = 1;
            
            hplane = e[hec,htm];
            vplane = e[vec,vtm];
            gtplane = e[gec,gtm];
            gbplane = e[gec,1-gtm];
        }
    }
}

//Collision 1D detection, up and down
if ds_list_size(ychk)
{   if gnew*(-2*gtm+1) < 0
    {   gme = gme + sq*(2*gtm-1);
        gtm = 1 - gtm;
    }
    ggravity = 0;
    
    for (i=0;i<ds_list_size(ychk);i++)
    {   e = ychk[|i];
        gdiff = e[gec,gtm] - gme;
        if abs(gdiff) <= abs(gnew)
            gnew = gdiff;
        if gdiff*(-2*gtm+1) < gold*(-2*gtm+1)
            gold = gdiff;
        
        if (e[3].sprite_width==64) and (e[3].sprite_height==64)
        and (ds_list_size(ychk)==1)
        {   spx = e[0,0] - 64*!(nort==3 or nort==4);
            spx2 = spx + 192 - 128*(nort==3 or nort==4);
            spz = e[1,0] - 64*!(nort==2 or nort==5);
            spz2 = spz + 192 - 128*(nort==2 or nort==5);
            spy = e[2,0] - 64*!(nort==1 or nort==6);
            spy2 = spy + 192 - 128*(nort==1 or nort==6);
            spbb = 1;
            nospin = 0;
            
            for (j=0;j<ds_list_size(cub);j++)
            {   c = cub[|j];
                if (spx)<c[0,1]
                and (spx2)>c[0,0]
                and (e[3]!=c[3])
                    ds_list_add(xchk,c);
            }
            for (j=0;j<ds_list_size(xchk);j++)
            {   c = xchk[|j];
                if (spz)<c[1,1]
                and (spz2)>c[1,0]
                    ds_list_add(zchk,c);
            }
            for (j=0;j<ds_list_size(zchk);j++)
            {   c = zchk[|j];
                if (spy<c[2,1]) and (spy2>c[2,0])
                {   nospin = 1;
                    break;
                }
            }
            if !nospin and (x+xspeed>=spx) and (x2+xspeed<=spx2)
            and (z+zspeed>=spz) and (z2+zspeed<=spz2)
            and (y+yspeed>=spy) and (y2+yspeed<=spy2)
            {   e[3].top = 3;
            }
            else
            {   e[3].top = 2;
                nospin = 1;
            }
        }
        else
        {   e[3].top = 1;
            nospin = 1;
        }
    //f = e[2,ye];
    /*if (abs(ystest)<abs(yspeed))
        ynew = ystest;
    else
        ynew = yspeed;*/
    /*if ds_list_size(ychk) > 1
    {   //e = ychk[|1];
        //ydiff = e[2,ye];
        for (i=1;i<ds_list_size(ychk);i++)
        {   e = ychk[|i];
            //e = ychk[|0];
            ystest = abs(e[2,ye] - yt);
            
            /*if !(xdiff==e[0,xe] and zdiff==e[1,ze])
            {   if ((ystest)>(ynew))
                {   ynew = ystest;
                    //yold = -1;
                    f = e[2,ye];
                }*/
                //yold = -1;
            /*}
            else if yold != -1
                yold = 1;*/
            //ydiff = e[2,ye];
        //}
    }
    //ynew *= -1;
    //yspeed = f - yt - ynew;
}
else
    ggravity += 0.2;

//Position update
switch (qspin)
{   case 1: x += (hnew*!hold)+(xspeed*(hold>0));
            z += (vnew*!vold)+(zspeed*(vold>0));
            y += gnew + gold;//*!yold);//+(yspeed);
            break;
    case 2: x += (hnew*!hold)+(xspeed*(hold>0));
            y += (vnew*!vold)+(yspeed*(vold>0));
            z += (gnew) + gold;//*!yold);//+(yspeed);
            break;
    case 3: y += (hnew*!hold)+(yspeed*(hold>0));
            z += (vnew*!vold)+(zspeed*(vold>0));
            x += (gnew) + gold;//*!yold);//+(yspeed);
            break;
    case 4: y += (hnew*!hold)+(yspeed*(hold>0));
            z += (vnew*!vold)+(zspeed*(vold>0));
            x += (gnew) + gold;//*!yold);//+(yspeed);
            break;
    case 5: x += (hnew*!hold)+(xspeed*(hold>0));
            y += (vnew*!vold)+(yspeed*(vold>0));
            z += (gnew) + gold;//*!yold);//+(yspeed);
            break;
    case 6: x += (hnew*!hold)+(xspeed*(hold>0));
            z += (vnew*!vold)+(zspeed*(vold>0));
            y += (gnew) + gold;//*!yold);//+(yspeed);
            break;
}
x2 = x + sq;
z2 = z + sq;
y2 = y + sq;
ds_list_destroy(cub);
ds_list_destroy(xchk);
ds_list_destroy(zchk);
ds_list_destroy(ychk);
ds_list_destroy(gchk);

