clear all; close all; clc;

d_earth_moon = 405000;
heigth_gps = 20200;
heigth_gal = 23222;
heigth_lcns = 9750;

g_rx = 15;
l_tx = 1;
l_rx_gps = 1;
l_rx_gal = 1.6;
l_rx_lcns = 1;
prx_gps = -158.5;
prx_gal = -150.25;
prx_lcns = -150.25;

d_gps = d_earth_moon - heigth_gps;
d_gal = d_earth_moon - heigth_gal;
d_lcns = heigth_lcns;

f_gnss = 1.57542;
f_lcns = 2.495;

l_gps = 20*log10(d_gps)+20*log10(f_gnss)+92.45;
l_gal = 20*log10(d_gal)+20*log10(f_gnss)+92.45;
l_lcns = 20*log10(d_lcns)+20*log10(f_lcns)+92.45;

EIRP_gps = prx_gps+l_gps-g_rx+l_rx_gps+l_tx;
EIRP_gal = prx_gal+l_gal-g_rx+l_rx_gal+l_tx;
EIRP_lcns = prx_lcns+l_lcns-g_rx+l_rx_lcns+l_tx;

EIRP_gps = 35.51;
EIRP_gal = 32.79;
g_t = -11.849;
k = -228.6;

cn0_gps = prx_gps - 30 + g_t - k
cn0_gps = prx_gal - 30 + g_t - k
%cn0_lcns = EIRP_lcns + g_t - k