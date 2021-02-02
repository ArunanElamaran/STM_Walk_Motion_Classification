//
//  main.c
//  DecisionTree
//
//  Created by Arunan Elamaran on 1/25/21.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <limits.h>

//------------------------------GLOBAL VARIABLES-----------------------------------------

char *directory = "/Users/arunanelamaran/Desktop/STM_Project/DecisionTree/DecisionTree/";


//------------------------------STRUCTS-----------------------------------------

struct Motion
{
    struct AvgInfo
    {
        double avg;
        double absavg;
        double peakavg;
        double troughavg;
    };

    struct AvgInfo AX;
    struct AvgInfo AY;
    struct AvgInfo AZ;
    struct AvgInfo GX;
    struct AvgInfo GY;
    struct AvgInfo GZ;
};



//------------------------------FUNCTIONS-----------------------------------
//void normalize(char* filename);
int analyze(char* filename, struct Motion *motionptr); //figures out basic avg
int analyzeInfo(char* filename, int place, struct AvgInfo *axisptr, struct AvgInfo still); //figures out peak and trough avg


//------------------------------MAIN METHOD---------------------------------------
int main(int argc, const char * argv[]) {
    
    /*normalize("StandStill.csv");
    normalize("Normal.csv");
    normalize("Ascent.csv");
    normalize("Descent.csv");
    normalize("New.csv");*/
    
    struct Motion Stand;
    struct Motion Normal;
    struct Motion Ascent;
    struct Motion Descent;
    struct Motion New;
    
    int success;
    success = analyze("StandStill.csv", &Stand)
            *analyze("Normal.csv", &Normal)
            *analyze("Ascent.csv", &Ascent)
            *analyze("Descent.csv", &Descent)
            *analyze("New.csv", &New);
    
    printf("%f\n", Normal.AX.avg);
    
    if(success) { return 0; }
    
    if (2==1) { //check if stand still
        
    }
    
    else if(New.AX.absavg == Normal.AX.absavg ||
       (New.AX.absavg < Ascent.AX.absavg && New.AX.absavg < Descent.AX.absavg))
    { //could also do same thing with GZ
        printf("Normal");
    }
    
    else
    {
        analyzeInfo("New.csv", 3, &(New.AZ), Stand.AZ);
        analyzeInfo("Ascent.csv", 3, &(Ascent.AZ), Stand.AZ);
        analyzeInfo("Descent.csv", 3, &(Descent.AZ), Stand.AZ);
        
        if(New.AZ.peakavg > Ascent.AZ.peakavg &&
           New.AZ.troughavg > Ascent.AZ.troughavg)
        {
            printf("Descent");
        }
        
        else if(New.AZ.peakavg < Descent.AZ.peakavg &&
                New.AZ.troughavg < Descent.AZ.troughavg)
        {
            printf("Ascent");
        }
        
        else
        {
            printf("Unclassifiable motion performed");
        }
    }
    
    return 0;
}


//------------------------------FUNCTION INITALIZATION-----------------------------------------

/*void normalize(char* filename)
{
    
}*/

int analyze(char* filename, struct Motion *motionptr)
{
    int count = 0;
    int place = 0;
    
    long AXsum = 0, absAXsum = 0;
    long AYsum = 0, absAYsum = 0;
    long AZsum = 0, absAZsum = 0;
    long GXsum = 0, absGXsum = 0;
    long GYsum = 0, absGYsum = 0;
    long GZsum = 0, absGZsum = 0;
    
    char full_directory[500];
    strcpy(full_directory, directory);
    strcat(full_directory, filename);
    
    FILE *file = fopen(full_directory, "r");
    
    if(file == NULL)
    {
        printf("Could not open %s. \n",filename);
        return 0;
    }
    
    char line[200];
    
    while(fgets(line, sizeof(line), file))
    {
        char *token;
        token = strtok(line, ",");
        
        while(token != NULL)
        {
            int num = atoi(token); //convert token into num
            switch(place)
            {
                case 1:
                    AXsum += num;
                    absAXsum += abs(num);
                    break;
                    
                case 2:
                    AYsum += num;
                    absAYsum += abs(num);
                    break;
                
                case 3:
                    AZsum += num;
                    absAZsum += abs(num);
                    break;
                    
                case 4:
                    GXsum += num;
                    absGXsum += abs(num);
                    break;
                    
                case 5:
                    GYsum += num;
                    absGYsum += abs(num);
                    break;
                    
                case 6:
                    GZsum += num;
                    absGZsum += abs(num);
                    break;
            }
            
            
            token = strtok(NULL, ",");
            place += 1;
        }
        
        count += 1;
        place = 0;
    }
    
    motionptr->AX.avg = (double)AXsum/count;
    motionptr->AY.avg = (double)AYsum/count;
    motionptr->AZ.avg = (double)AZsum/count;
    motionptr->GX.avg = (double)GXsum/count;
    motionptr->GY.avg = (double)GYsum/count;
    motionptr->GZ.avg = (double)GZsum/count;
    
    motionptr->AX.absavg = (double)absAXsum/count;
    motionptr->AY.absavg = (double)absAYsum/count;
    motionptr->AZ.absavg = (double)absAZsum/count;
    motionptr->GX.absavg = (double)absGXsum/count;
    motionptr->GY.absavg = (double)absGYsum/count;
    motionptr->GZ.absavg = (double)absGZsum/count;
    
    return 1;
}

int analyzeInfo(char* filename, int place, struct AvgInfo *axisptr, struct AvgInfo still)
{
    long peaksum = 0;
    int peakcount = 0;
    long troughsum = 0;
    int troughcount = 0;
    
    char full_directory[500];
    strcpy(full_directory, directory);
    strcat(full_directory, filename);
    
    FILE *file = fopen(full_directory, "r");
    
    if(file == NULL)
    {
        printf("Could not open %s. \n",filename);
        return 0;
    }
    
    char line[200];
    
    while(fgets(line, sizeof(line), file))
    {
        char *token;
        token = strtok(line, ",");
        
        int spot = 0;
        while(token != NULL)
        {
            if (spot == place)
            {
                int num = atoi(token); //convert token into num
                if(num > still.avg)
                {
                    peaksum += num;
                    peakcount++;
                }
                
                else if(num < still.avg)
                {
                    troughsum += num;
                    troughcount++;
                }
            }
            spot++;
            token = strtok(NULL, ",");
        }
    }
    
    axisptr->peakavg = (double)peaksum/peakcount;
    axisptr->troughavg = (double)troughsum/troughcount;
    
    return 1;
}





/*int avg_AXnormal; //AX averages all absolute value when calcing avg
int avg_AXascent;
int avg_AXdescent;


int avg_AZascent_peaks;
int avg_AZascent_troughs;
int avg_AZdescent_peaks;
int avg_AZdescent_troughs;

int avg_newAX;
int avg_newAZ_peaks;
int avg_newAZ_troughs;

if(avg_newAX == avg_AXnormal ||
   (avg_newAX < avg_AXascent && avg_newAX < avg_AXdescent))
{ //could also do same thing with GZ
    printf("Normal");
}

else
{
    if(avg_newAZ_peaks > avg_AZascent_peaks &&
       avg_newAZ_troughs > avg_AZascent_troughs)
    {
        printf("Descent");
    }
    
    else if(avg_newAZ_peaks < avg_AZdescent_peaks &&
       avg_newAZ_troughs < avg_AZdescent_troughs)
    {
        printf("Ascent");
    }
}*/
