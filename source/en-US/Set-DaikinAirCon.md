---
external help file: pstools.daikin-help.xml
Module Name: pstools.daikin
online version:
schema: 2.0.0
---

# Set-DaikinAirCon

## SYNOPSIS

## SYNTAX

```
Set-DaikinAirCon [[-HostName] <Object>] [[-PowerOn] <Boolean>] [[-Temp] <Int32>] [[-Mode] <Object>]
 [[-FanSpeed] <Object>] [[-FanDirection] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Cmdlet allows to configure the aircon device to the desired setting.

## EXAMPLES

### EXAMPLE 1
```
Set-DaikinAirCon -HostName daikin.local.network -PowerOn:$true -Temp 19 -Mode AUTO -FanSpeed AUTO -FanDirection Stopped
```

This example configures the aircon device to the specified parameter values.

## PARAMETERS

### -HostName
Hostname or IP of the Daikin AirCon device.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PowerOn
Set to $true or $false to specify if the master power should be on or off.
This does not the affect the connectivity of the control surfice.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Temp
Specified the target temperature in celcius.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Mode
Specifies the operating mode of the aircon device.
Allowed values are;
AUTO  : Switches between heat and cold depending on the current and target temperature.
DRY   : Sets the device lower the humidity of the air.
COLD  : Sets the device chill the air if needed.
No heat will be provided.
HEAT  : Sets the device heat the air if needed.
No chilling of air will be provided.
FAN   : Sets the device to only circulate air without affecting temperature or humidity.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FanSpeed
Specifies the strenght of the fan.
Allowed values are;
AUTO   : Sets the device to manage fan speed to keep the target climate.
SILENT : Sets the fan speed to minimize noise.
Level_1 -\> Level_5 : Sets the fan speed to the target level.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FanDirection
Specifies how the direction of airflow is controlled.
Allowed values are
Stopped, VerticalSwing, HorizontalSwing and BothSwing

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
