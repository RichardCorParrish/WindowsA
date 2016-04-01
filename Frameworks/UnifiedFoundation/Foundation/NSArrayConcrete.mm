//******************************************************************************
//
// Copyright (c) 2015 Microsoft Corporation. All rights reserved.
//
// This code is licensed under the MIT License (MIT).
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//******************************************************************************

#include "Starboard.h"
#include "StubReturn.h"
#include "CFHelpers.h"
#include "CFFoundationInternal.h"
#include "NSArrayConcrete.h"
#include "NSCFArray.h"
#include "BridgeHelpers.h"
#include <CoreFoundation/CFArray.h>

static const wchar_t* TAG = L"NSArray";

@implementation NSArrayConcrete {
@private
    StrongId<NSCFArray> _nscf;
}

- (instancetype)initWithObjects:(id _Nonnull const*)objs count:(NSUInteger)count {
    if (self = [super init]) {
        _nscf.attach(static_cast<NSCFArray*>(CFArrayCreate(NULL, (const void**)(objs), count, &kCFTypeArrayCallBacks)));
    }
    return self;
}

- (instancetype)init {
    return [self initWithObjects:nullptr count:0];
}

- INNER_BRIDGE_CALL(_nscf, NSUInteger, count);
- INNER_BRIDGE_CALL(_nscf, id, objectAtIndex:(NSUInteger)index);

@end
