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
      //precio bid
      double bid = GetBidPrice(symbol);
      //precio ask
      double ask = GetAskPrice(symbol);
      Print("Simbolo: ", symbol," BID: ", bid, " ASK ", ask);
      datetime currentTime = TimeCurrent();
     
      //MqlDateTime stm;
      //TimeToStruct(currentTime, stm);
      //Print("Hora", stm.hour, "Minutos", stm.min);
      Print("Simbolo: ", IsKillZone());
   }
  }
  
double GetBidPrice(string symbol){
   return SymbolInfoDouble(symbol, SYMBOL_BID);
}
double GetAskPrice(string symbol){
   return SymbolInfoDouble(symbol, SYMBOL_ASK);
}
//MTQ 5 trabaja con horario UTC por eso debemos usar esta funcion para sabe rsi estamos en la killzone o zona para operar
bool IsKillZone() {
    // Hora actual en MetaTrader
    datetime currentTime = TimeCurrent();
    MqlDateTime stm;
    TimeToStruct(currentTime, stm);

    
    // Obtener horas y minutos actuales
    int currentHour = stm.hour;
    int currentMinute = stm.min;
    
    // Constantes de la killzone (07:00 AM UTC a 12:00 PM UTC)
    const int KILLZONE_START_HOUR = 7;
    const int KILLZONE_END_HOUR = 12;
    
    // Verificar si estamos dentro del rango de la killzone
    if ((currentHour > KILLZONE_START_HOUR && currentHour < KILLZONE_END_HOUR) || 
        (currentHour == KILLZONE_START_HOUR) || 
        (currentHour == KILLZONE_END_HOUR && currentMinute == 0)) 
    {
        return true;  // Dentro de la killzone
    }

    return false;  // Fuera de la killzone
}



void OnDeinit(const int reason) {}