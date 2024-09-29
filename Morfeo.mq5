//+------------------------------------------------------------------+
//|                                                       Morfeo.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// Símbolos para operar
string symbols[] = {"EURUSD", "XAUUSD", "GBPUSD"};  // Lista de activos que queremos operar

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Print("Bot iniciado");
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   for(int i = 0; i< ArraySize(symbols); i++){
      string symbol = symbols[i];
      
      Print("Simbolo: ", symbol,"");
   }
  }

void OnDeinit(const int reason) {}