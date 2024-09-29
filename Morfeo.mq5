//+------------------------------------------------------------------+
//|                                                       Morfeo.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// Variables de configuración
double stopLoss = 150;  // Stop Loss en ticks
double takeProfit = 30; // Take Profit en ticks
double riskPerTrade = 0.05;  // Riesgo por operación (5% del capital)
double rewardRatio = 0.2;  // Recompensa (1% del capital)
string symbols[] = {"EURUSD", "XAUUSD", "GBPUSD"};  // Activos a operar

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
  
void OnTick()
{
   // Verificar si estamos dentro de la killzone
   if (!isKillzone())
   {
      return;  // Si no estamos dentro de la killzone, no hacemos nada
   }

   // Verificar si ya tenemos una operación abierta
   if (PositionsTotal() > 0)
   {
      return;  // Si ya hay una operación abierta, no abrimos otra
   }

   // Obtener las medias móviles como ejemplo (en tu caso será el TDI)
   double maRapida = iMA(_Symbol, _Period, 12, 0, MODE_EMA, PRICE_CLOSE, 0);  // Media móvil rápida (EMA 12)
   double maLenta  = iMA(_Symbol, _Period, 26, 0, MODE_EMA, PRICE_CLOSE, 0);  // Media móvil lenta (EMA 26)

   // Condición de compra: la media rápida cruza por encima de la lenta
   if (maRapida > maLenta)
   {
      double lotes = calcularLotes();  // Función para calcular el tamaño de la posición
      abrirOperacion(OP_BUY, lotes);  // Función para abrir una operación de compra
   }

   // Condición de venta: la media rápida cruza por debajo de la lenta
   if (maRapida < maLenta)
   {
      double lotes = calcularLotes();
      abrirOperacion(OP_SELL, lotes);  // Función para abrir una operación de venta
   }
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Trade function                                                   |
//+------------------------------------------------------------------+
void OnTrade()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| TradeTransaction function                                        |
//+------------------------------------------------------------------+
void OnTradeTransaction(const MqlTradeTransaction& trans,
                        const MqlTradeRequest& request,
                        const MqlTradeResult& result)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Tester function                                                  |
//+------------------------------------------------------------------+
double OnTester()
  {
//---
   double ret=0.0;
//---

//---
   return(ret);
  }
//+------------------------------------------------------------------+
