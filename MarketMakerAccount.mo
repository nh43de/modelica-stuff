model MarketMakerAccount
  Modelica.Blocks.Interfaces.RealInput N_b "Number bought as a function of time" annotation(Placement(visible = true, transformation(origin = {-168.279, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 31.766}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput N_a "Number sold as a function of time" annotation(Placement(visible = true, transformation(origin = {-168.161, 22.515}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 75.52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput S_b "The bid price of the asset as a function of time" annotation(Placement(visible = true, transformation(origin = {-168.283, -47.913}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add Inventory(k2 = -1) "The total inventory of the market maker" annotation(Placement(visible = true, transformation(origin = {-25, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput S_a "The ask price of the asset as a function of time" annotation(Placement(visible = true, transformation(origin = {-168.165, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -35.396}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add add(k1 = -1) annotation(Placement(visible = true, transformation(origin = {40, -47.791}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product SellCashflowRate "Rate of cash proceeds from selling" annotation(Placement(visible = true, transformation(origin = {-15, -73.252}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative BuyRate "Rate which the market maker is buying" annotation(Placement(visible = true, transformation(origin = {-103.13, 47.362}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator MarketMakerCash "The net cash position" annotation(Placement(visible = true, transformation(origin = {81.748, -47.671}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative SellRate "Rate which the market maker is selling" annotation(Placement(visible = true, transformation(origin = {-101.657, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product BuyCashflowRate "Rate of cash outlay" annotation(Placement(visible = true, transformation(origin = {-65, -42.055}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product InventoryMarketValue "Market value of the inventory" annotation(Placement(visible = true, transformation(origin = {50, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput q_t "The quantity of inventory" annotation(Placement(visible = true, transformation(origin = {158.474, 45}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 54.774}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Q_t "The value of the inventory" annotation(Placement(visible = true, transformation(origin = {158.315, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 14.564}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput X_t "Cash account value" annotation(Placement(visible = true, transformation(origin = {158.433, -47.515}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(N_b, Inventory.u1) annotation(Line(visible = true, origin = {-71.32, 60.5}, points = {{-96.959, 9.5}, {31.32, 9.5}, {31.32, -9.5}, {34.32, -9.5}}, color = {1, 37, 163}));
  connect(N_a, Inventory.u2) annotation(Line(visible = true, origin = {-71.29, 30.758}, points = {{-96.871, -8.242}, {31.29, -8.242}, {31.29, 8.242}, {34.29, 8.242}}, color = {1, 37, 163}));
  connect(N_b, BuyRate.u) annotation(Line(visible = true, origin = {-129.917, 58.681}, points = {{-38.362, 11.319}, {11.787, 11.319}, {11.787, -11.319}, {14.787, -11.319}}, color = {1, 37, 163}));
  connect(N_a, SellRate.u) annotation(Line(visible = true, origin = {-128.783, 13.758}, points = {{-39.378, 8.758}, {12.126, 8.758}, {12.126, -8.758}, {15.126, -8.758}}, color = {1, 37, 163}));
  connect(S_a, SellCashflowRate.u2) annotation(Line(visible = true, origin = {-63.791, -79.626}, points = {{-104.374, -0.374}, {33.791, -0.374}, {33.791, 0.374}, {36.791, 0.374}}, color = {1, 37, 163}));
  connect(S_b, BuyCashflowRate.u2) annotation(Line(visible = true, origin = {-101.321, -47.984}, points = {{-66.962, 0.071}, {21.321, 0.071}, {21.321, -0.071}, {24.321, -0.071}}, color = {1, 37, 163}));
  connect(BuyCashflowRate.y, add.u1) annotation(Line(visible = true, origin = {6, -41.923}, points = {{-60, -0.132}, {19, -0.132}, {19, 0.132}, {22, 0.132}}, color = {1, 37, 163}));
  connect(SellCashflowRate.y, add.u2) annotation(Line(visible = true, origin = {18.5, -63.522}, points = {{-22.5, -9.73}, {6.5, -9.73}, {6.5, 9.73}, {9.5, 9.73}}, color = {1, 37, 163}));
  connect(SellRate.y, SellCashflowRate.u1) annotation(Line(visible = true, origin = {-73.91, -37.629}, points = {{-16.746, 42.629}, {-14.254, 42.629}, {-14.254, -29.623}, {46.91, -29.623}}, color = {1, 37, 163}));
  connect(BuyRate.y, BuyCashflowRate.u1) annotation(Line(visible = true, origin = {-82.283, 5.654}, points = {{-9.848, 41.709}, {2.283, 41.709}, {2.283, -41.709}, {5.283, -41.709}}, color = {1, 37, 163}));
  connect(add.y, MarketMakerCash.u) annotation(Line(visible = true, origin = {63.561, -47.731}, points = {{-12.561, -0.06}, {3.187, -0.06}, {3.187, 0.06}, {6.187, 0.06}}, color = {1, 37, 163}));
  connect(Inventory.y, InventoryMarketValue.u1) annotation(Line(visible = true, origin = {23.5, 28}, points = {{-37.5, 17}, {11.5, 17}, {11.5, -17}, {14.5, -17}}, color = {1, 37, 163}));
  connect(S_b, InventoryMarketValue.u2) annotation(Line(visible = true, origin = {-73.122, -29.365}, points = {{-95.161, -18.548}, {-63.541, -18.548}, {-63.541, 4.365}, {111.122, 4.365}, {111.122, 28.365}}, color = {1, 37, 163}));
  connect(Inventory.y, q_t) annotation(Line(visible = true, origin = {72.237, 45}, points = {{-86.237, 0}, {86.237, 0}}, color = {1, 37, 163}));
  connect(InventoryMarketValue.y, Q_t) annotation(Line(visible = true, origin = {109.658, 5}, points = {{-48.658, 0}, {48.658, 0}}, color = {1, 37, 163}));
  connect(MarketMakerCash.y, X_t) annotation(Line(visible = true, origin = {135.399, -47.593}, points = {{-42.651, -0.078}, {9.809, -0.078}, {9.809, 0.078}, {23.034, 0.078}}, color = {1, 37, 163}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {1, 37, 163}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Ellipse(visible = true, fillColor = {255, 255, 255}, lineThickness = 15, extent = {{-50, -50}, {50, 50}}), Text(visible = true, extent = {{-30, -24}, {30, 24}}, textString = "M"), Text(visible = true, textColor = {64, 64, 64}, extent = {{-150, 110}, {150, 150}}, textString = "%name")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end MarketMakerAccount;
