function Convert-ArrayToHashtable {
    param(
        [int]$BatchSize,
        [array]$InputArray
    )
    Begin {}
    Process {
        if (!$BatchSize) {
            $BatchSize = $InputArray.Count
        }
        $NewBatch = @{}
        $i = 0
        $MaxBatches = [math]::Floor($InputArray.Count / $BatchSize)
        foreach ($Entry in $InputArray) {
            $NewBatch[$i % $MaxBatches] += @($Entry)
            $i++
        }
    }
    End {
        return $NewBatch
    }
}