---
external help file: pstools.daikin-help.xml
Module Name: pstools.daikin
online version:
schema: 2.0.0
---

# Get-DaikinStatus

## SYNOPSIS

## SYNTAX

```
Get-DaikinStatus [[-HostName] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Retreives the current configuration of the Daikin AirCon device

## EXAMPLES

### EXAMPLE 1
```
Get-DaikinStatus -Hostname daikin.local.network
```

PowerOn        : True
Mode           : HEAT
TargetTemp     : 22.0
...

## PARAMETERS

### -HostName
Hostname or IP of the Daikin Aircon device.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
