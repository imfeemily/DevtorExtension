# DevtorExtension

[![CI Status](https://img.shields.io/travis/ifeemily@gmail.com/DevtorExtension.svg?style=flat)](https://travis-ci.org/ifeemily@gmail.com/DevtorExtension)
[![Version](https://img.shields.io/cocoapods/v/DevtorExtension.svg?style=flat)](https://cocoapods.org/pods/DevtorExtension)
[![License](https://img.shields.io/cocoapods/l/DevtorExtension.svg?style=flat)](https://cocoapods.org/pods/DevtorExtension)
[![Platform](https://img.shields.io/cocoapods/p/DevtorExtension.svg?style=flat)](https://cocoapods.org/pods/DevtorExtension)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


# Usage

## UIImageView
### Circle imageView
```
imageView.circleImageView(borderColor: .black, borderWidth: 1)

```

### Download image from URL

Without caching (default)
```
imageView.downloaded(from: "https://example.com/image", contentMode: .scaleToFill)

```

With caching
```
imageView.downloaded(from: "https://example.com/image", contentMode: .scaleToFill, cache: true)

```

## UIImage

### Base 64

Set image from base64
```
imageView.imageFromBase64(base64: base64_string)

```
Get base64 string from image (JPEG)
```
imageView.image.base64(format: .jpeg(100), completion: { base64 in
print("Your base64 string is \(base64)")
})

```

Get base64 string from image (PNG)
```
imageView.image.base64(format: .png, completion: { base64 in
print("Your base64 string is \(base64)")
})

```

OR without completion
```
imageView.image.convertImageTobase64(format: .jpeg(100))

imageView.image.convertImageTobase64(format: .png)

```

### Image resizing

By percentage
```
imageView.image.resizeWithPercent(percentage: 50)

```

By width
```
imageView.image.resizeWithWidth(width: 120)

```

Scale image to new size
```
imageView.image.scaleImageToSize(width: 800, height: 400)

```

### Image resizing

By percentage
```
let newImage = imageView.image.imageWithColor(color: .black)

```

## UIColor

You can use `Material Colors, Metro Colors, Flat Colors, Social Colors(Facebook, LINE, etc.)` with very simple way!
You can [go to MaterialUI](https://www.materialui.co/colors) for reference.

Example
```
let colorGreen = UIColor.Material.Green.primary

```

#### Get color from hex
```
UIColor(netHex: 0xffa140)

```
#### Set color to darker
```
color.darker(by: 30)

```

#### Set color to lighter
```
color.lighter(by: 30)

```

#### Color from image
```
image.averageColor()

```

## String
### Data validation

#### Thai citizen ID
```
string.verifyCitizenID()

```

#### Mobile number
This function will check this number is valid or not and return Thai Mobile number validation result also.
> Thailand Mobile number : 06, 08, 09
> Thailand Phone number: 02, 03, 04, 05, 07
```
string.verifyMobileNumber()

```

#### Alphanumeric validation (Number and Alphavbet)
```
string.isAlphanumeric()

```

#### Number validation
```
string.isNumber()

```

### Convert to Format

#### Thai citizen ID
> x-xxxx-xxxxx-xx-x
```
string.toCitizenIDFormat()
```
######  Citizen ID with secure format
> 0-0000-xxxxx-xx-0
```
string.hideCitizenID()
```

You also can custom dialog with your character like this.
> Default is "-"
```
string.hideCitizenID(character: "-")
```

#### Mobile number
> xxx-xxx-xxxx
```
string.toMobileNumberFormat()
```

You also can custom dialog with your character like this.
> Default is "-"
```
string.toMobileNumberFormat(character: "-")
```
######  Mobile number with secure format
> 000 xxx xx00
```
string.hideMobileNumber()
```

You also can custom dialog with your character like this.
> Default is "-"
```
string.hideMobileNumber(character: "-")
```

#### Passport secure format
> 10 digits: yy-xxxxxxx
>   9 digits: yx-xxxxxx
>   8 digits: yx-xxxxx
>   7 digits: xx-xxxx
```
string.hidePassport()

```

#### Paperang Mac address
> This function support only Paperang printer.
> XX:XX:XX:XX:XX:XX
```
string.toPaperangMacAddressFormat()
```

#### QR Code
```
string.toQRCode()
```

#### Barcode (Code128)
```
string.toBarcode()
```


### Navigation Controller

#### Remove hair line
```
NavigationController.removeHairLine()
```

#### Add image 
```
NavigationController.addImageToNavigationBar(titleImage: UIImage())
```

## Requirements

* iOS 10.0+
* Swift 4.0+

## Installation

DevtorExtension is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DevtorExtension'
```

## Author

Feem.io

## License

DevtorExtension is available under the MIT license. See the LICENSE file for more info.
