Config = {
    {
        price = 150,
        text = "Change clothes",
        blip = {
            label = "Clothing store",
            sprite = 73,
            scale = 0.65,
            color = 3
        },
        appearance = {
            components = true,
            props = true,
        },
        locations = {
            {
                model = `s_f_y_shop_low`,
                worker = vec4(5.28, 6510.96, 31.88, 47.74),
                change = vec4(11.10, 6513.75, 31.88, 44.84)
            },
            {
                model = `s_f_y_shop_low`,
                worker = vec4(1695.41, 4822.61, 42.06, 99.90),
                change = vec4(1696.50, 4828.62, 42.06, 96.94)
            },
            {
                model = `s_f_y_shop_low`,
                worker = vec4(-1102.10, 2711.88, 19.11, 225.41),
                change = vec4(-1107.79, 2709.55, 19.11, 224.57)
            },
            {
                model = `s_f_y_shop_mid`,
                worker = vec4(613.02, 2762.18, 42.09, 275.86),
                change = vec4(617.47, 2765.67, 42.09, 184.34)
            },
            {
                model = `s_f_y_shop_low`,
                worker = vec4(1196.89, 2711.62, 38.22, 182.17),
                change = vec4(1191.30, 2713.67, 38.22, 184.49)
            },
            {
                model = `s_f_y_shop_mid`,
                worker = vec4(-3169.21, 1043.64, 20.86, 71.35),
                change = vec4(-3175.01, 1042.75, 20.86, 334.28)
            },
            {
                model = `s_f_m_shop_high`,
                worker = vec4(-708.97, -151.78, 37.42, 119.53),
                change = vec4(-704.33, -151.64, 37.42, 190.64)
            },
            {
                model = `s_f_m_shop_high`,
                worker = vec4(-164.97, -302.96, 39.73, 247.76),
                change = vec4(-168.40, -299.32, 39.73, 293.06)
            },
            {
                model = `s_f_y_shop_mid`,
                worker = vec4(127.09, -223.76, 54.56, 70.48),
                change = vec4(121.85, -224.58, 54.56, 336.21)
            },
            {
                model = `s_f_y_shop_mid`,
                worker = vec4(-1193.59, -766.76, 17.32, 218.92),
                change = vec4(-1189.36, -769.34, 17.32, 128.69)
            },
            {
                model = `s_f_y_shop_low`,
                worker = vec4(426.98, -806.47, 29.49, 90.35),
                change = vec4(428.58, -800.78, 29.49, 91.14)
            },
            {
                model = `s_f_y_shop_low`,
                worker = vec4(-822.87, -1072.20, 11.33, 209.86),
                change = vec4(-828.94, -1073.56, 11.33, 212.48)
            },
            {
                model = `s_f_y_shop_low`,
                worker = vec4(73.94, -1392.50, 29.38, 266.97),
                change = vec4(72.54, -1398.72, 29.38, 272.27)
            },
            {
                model = `s_f_m_shop_high`,
                worker = vec4(-1448.99, -238.10, 49.81, 49.79),
                change = vec4(-1447.16, -242.78, 49.82, 100.09)
            }
        }
    },
    {
        price = 300,
        text = "Get a tattoo",
        blip = {
            label = "Tattoo parlour",
            sprite = 75,
            scale = 0.65,
            color = 3
        },
        appearance = {
            tattoos = true
        },
        locations = {
            {
                model = `u_m_y_tattoo_01`,
                worker = vec4(319.86, 180.97, 103.59, 250.84),
                change = vec4(323.56, 179.92, 103.59, 73.69)
            },
            {
                model = `u_m_y_tattoo_01`,
                worker = vec4(1862.49, 3748.46, 33.03, 33.74),
                change = vec4(1864.79, 3747.05, 33.03, 30.42)
            },
            {
                model = `u_m_y_tattoo_01`,
                worker = vec4(-3170.51, 1073.09, 20.83, 339.55),
                change = vec4(-3168.97, 1077.23, 20.83, 161.56)
            },
            {
                model = `u_m_y_tattoo_01`,
                worker = vec4(-1152.35, -1423.65, 4.95, 128.28),
                change = vec4(-1155.59, -1426.40, 4.95, 307.28)
            },
            {
                model = `u_m_y_tattoo_01`,
                worker = vec4(1324.36, -1650.08, 52.28, 129.97),
                change = vec4(1320.97, -1653.27, 52.28, 313.14)
            },
            {
                model = `u_m_y_tattoo_01`,
                worker = vec4(-292.12, 6199.61, 31.49, 222.04),
                change = vec4(-294.41, 6200.52, 31.49, 221.79)
            }
        }
    },
    {
        price = 30,
        text = "Get a haircut",
        blip = {
            label = "Barber shop",
            sprite = 71,
            scale = 0.65,
            color = 3
        },
        appearance = {
            headOverlays = true
        },
        locations = {
            {
                model = `s_f_m_fembarber`,
                worker = vec4(-277.96, 6230.53, 31.70, 76.00),
                change = vec4(-277.82, 6226.55, 31.70, 314.70)
            },
            {
                model = `s_f_m_fembarber`,
                worker = vec4(1930.73, 3728.03, 32.84, 233.51),
                change = vec4(1931.89, 3732.03, 32.85, 120.92)
            },
            {
                model = `s_m_m_hairdress_01`,
                worker = vec4(-821.90, -183.30, 37.57, 205.83),
                change = vec4(-814.23, -182.45, 37.57, 211.02)
            },
            {
                model = `s_f_m_fembarber`,
                worker = vec4(-30.67, -151.69, 57.08, 3.10),
                change = vec4(-34.45, -153.40, 57.09, 251.27)
            },
            {
                model = `s_f_m_fembarber`,
                worker = vec4(1211.45, -470.60, 66.21, 97.45),
                change = vec4(1213.55, -474.17, 66.22, 348.66)
            },
            {
                model = `s_f_m_fembarber`,
                worker = vec4(-1284.27, -1115.34, 6.99, 128.04),
                change = vec4(-1281.34, -1118.29, 7.00, 358.13)
            },
            {
                model = `s_f_m_fembarber`,
                worker = vec4(134.58, -1708.00, 29.29, 166.99),
                change = vec4(138.70, -1707.60, 29.30, 48.86)
            }
        }
    }
}