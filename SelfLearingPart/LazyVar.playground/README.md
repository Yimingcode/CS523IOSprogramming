Lazy Var
===

### Here is a example how lazy var work.

### Lazy Stored Property vs Stored Property

1.The closure associated to the lazy property is executed only if you read that property. <br>
So if for some reason that property is not used (maybe because of some decision of the user) <br>
you avoid unnecessary allocation and computation.<br>
2.You can populate a lazy property with the value of a stored property.<br>
3.Important to note: You can use self inside the closure of a lazy property. <br>
It will not cause any retain cycles. The reason is that the immediately applied closure {}() is considered @noescape.<br>
It does not retain the captured self.
