function [img] = h2r(imagerec)
  pkg load image;

  imageH = imagerec(:, :, 1);
  imageS = imagerec(:, :, 2);
  imageI = imagerec(:, :, 3);

  imageH = imageH * 360;

  if imageH < 120
    B = imageI * (1 - imageS);
    R = imageI * (1 + (imageS * cosd(imageH) ./ cosd(60 - imageH)));
    G = 3 * imageI - (R + B);

    img = zeros(size(imagerec));
    img(:, :, 1) = R;
    img(:, :, 2) = G;
    img(:, :, 3) = B;

    imshow(uint8(img));
  elseif imageH >= 120 & imageH < 240
    Hnovo = imageH - 120;
    R = imageI * (1 - imageS);
    G = imageI * (1 + (imageS * cosd(Hnovo)) / cosd(60 - Hnovo));
    B = 3 * imageI - (R + G);

    img = zeros(size(imagerec));
    img(:, :, 1) = R;
    img(:, :, 2) = G;
    img(:, :, 3) = B;

    imshow(uint8(img));
  elseif imageH > 240
    aga = "360"
  endif
endfunction
