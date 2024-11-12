

Replace
```swift
 if self.elapsedTime < self.remaining {
                self.elapsedTime += 0.5
                self.remaining = 60 - self.elapsedTime
```

With
```swift
 if self.elapsedTime < self.totalDuration {
                self.elapsedTime += 0.5
                self.remaining = 60 - self.elapsedTime
```
